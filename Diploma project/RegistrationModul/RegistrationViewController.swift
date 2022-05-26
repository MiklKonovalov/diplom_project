//
//  RegistrationViewController.swift
//  Diploma project
//
//  Created by Misha on 18.05.2022.
//

import Foundation
import UIKit

final class RegistrationViewController: UIViewController {
    
    private let registrationModulPresenter: RegistrationModulPresenter
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let headLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.text = "ЗАРЕГИСТРИРОВАТЬСЯ"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let inputNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.text = "Введите номер"
        label.textColor =  .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Ваш номер будет использоваться для входа в аккаунт"
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let telephoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "+7___-___-__-__"
        textField.textColor = UIColor.black
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.backgroundColor = UIColor.black.cgColor
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let agreeButton: UIButton = {
        let agreeButton = UIButton()
        agreeButton.layer.cornerRadius = 10
        agreeButton.clipsToBounds = true
        agreeButton.setTitle("Далее", for: .normal)
        agreeButton.layer.backgroundColor = UIColor.systemGray.cgColor
        agreeButton.addTarget(self, action: #selector(agreeButtonPressed), for: .touchUpInside)
        agreeButton.translatesAutoresizingMaskIntoConstraints = false
        return agreeButton
    }()
    
    private let confirmLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Нажимая кнопку Далее Вы принимаете пользовательское соглашение и политику конфиденциальности"
        label.numberOfLines = 3
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Init
    
    init(registrationModulPresenter: RegistrationModulPresenter) {
        self.registrationModulPresenter = registrationModulPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backButton)
        view.addSubview(headLabel)
        view.addSubview(inputNumberLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(telephoneTextField)
        view.addSubview(agreeButton)
        view.addSubview(confirmLabel)
        
        setupConstraints()
    }
    
    //Functions
    
    private func setupConstraints() {
        
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        
        headLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        headLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        headLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        inputNumberLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 30).isActive = true
        inputNumberLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        inputNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: inputNumberLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        telephoneTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        telephoneTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        telephoneTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        telephoneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        agreeButton.topAnchor.constraint(equalTo: telephoneTextField.bottomAnchor, constant: 100).isActive = true
        agreeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        agreeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        agreeButton.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
        
        confirmLabel.topAnchor.constraint(equalTo: agreeButton.bottomAnchor, constant: 20).isActive = true
        confirmLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        confirmLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        confirmLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
    }
    
    //Selectors
    
    @objc func agreeButtonPressed() {
        registrationModulPresenter.showNextScreen()
    }
    
    @objc func backButtonPressed() {
        registrationModulPresenter.showPreviousScreen()
    }
}
