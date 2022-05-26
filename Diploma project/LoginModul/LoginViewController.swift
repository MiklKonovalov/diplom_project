//
//  LoginViewController.swift
//  Diploma project
//
//  Created by Misha on 23.05.2022.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    private let loginModulPresenter: LoginModulPresenter
    
    private let headLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "С возвращением"
        label.textColor = .systemOrange
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.text = "Введите номер телефона для входа в приложение"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let telephoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let agreeButton: UIButton = {
        let agreeButton = UIButton()
        agreeButton.layer.cornerRadius = 10
        agreeButton.clipsToBounds = true
        agreeButton.setTitle("Подтвердить", for: .normal)
        agreeButton.layer.backgroundColor = UIColor.systemGray.cgColor
        agreeButton.addTarget(self, action: #selector(agreeButtonPressed), for: .touchUpInside)
        agreeButton.translatesAutoresizingMaskIntoConstraints = false
        return agreeButton
    }()
    
    //Init
    
    init(loginModulPresenter: LoginModulPresenter) {
        self.loginModulPresenter = loginModulPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        view.addSubview(headLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(telephoneTextField)
        view.addSubview(agreeButton)
        
        setupConstraints()
        setupTextField()
    }
    
    //Functions
    
    private func setupConstraints() {
        
        headLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        headLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        headLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 50).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 3).isActive = true
        
        telephoneTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50).isActive = true
        telephoneTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        telephoneTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        telephoneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        agreeButton.topAnchor.constraint(equalTo: telephoneTextField.bottomAnchor, constant: 100).isActive = true
        agreeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        agreeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        agreeButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
    }
    
    private func setupTextField() {
        telephoneTextField.placeholder = "+7___-___-__-__"
        telephoneTextField.textColor = UIColor.black
        telephoneTextField.layer.cornerRadius = 10
        telephoneTextField.clipsToBounds = true
        telephoneTextField.layer.borderColor = UIColor.black.cgColor
        telephoneTextField.layer.backgroundColor = UIColor.black.cgColor
        telephoneTextField.layer.backgroundColor = UIColor.white.cgColor
        telephoneTextField.layer.borderWidth = 1
        
    }
    
    //Selectors
    
    @objc func agreeButtonPressed() {
        loginModulPresenter.showNextScreen()
    }
    
}
