//
//  ConfirmViewController.swift
//  Diploma project
//
//  Created by Misha on 24.05.2022.
//

import Foundation
import UIKit

enum ConfirmViewControllerButton {
    case backButton
    case registrationButton
}

protocol ConfirmViewControllerProtocol {
    func checkLogin(message: String) -> User
}

final class ConfirmViewController: UIViewController {
    
    private let confirmModulPresenter: ConfirmModulPresenter
    
    var delegate: ConfirmViewControllerProtocol?
    
    var output: ((ConfirmViewControllerButton) -> Void)?
    
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
        label.text = "Подтверждение регистрации"
        label.textColor = .systemOrange
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Мы отправили смс с кодом на номер:"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let smsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Введите код из SMS"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let telephoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "___-__-__"
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
    
    private let registrationButton: UIButton = {
        let agreeButton = UIButton()
        agreeButton.layer.cornerRadius = 10
        agreeButton.clipsToBounds = true
        agreeButton.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        agreeButton.layer.backgroundColor = UIColor.systemGray.cgColor
        agreeButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        agreeButton.translatesAutoresizingMaskIntoConstraints = false
        return agreeButton
    }()
    
    //Init
    
    init(confirmModulPresenter: ConfirmModulPresenter) {
        self.confirmModulPresenter = confirmModulPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(smsLabel)
        view.addSubview(telephoneTextField)
        view.addSubview(registrationButton)
        view.addSubview(backButton)
        
        setupConstraints()
        
    }
    
    //Function
    
    func setupConstraints() {
        
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        headLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        headLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        headLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        telephoneTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        telephoneTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        telephoneTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        telephoneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        smsLabel.bottomAnchor.constraint(equalTo: telephoneTextField.topAnchor, constant: -10).isActive = true
        smsLabel.leadingAnchor.constraint(equalTo: telephoneTextField.leadingAnchor).isActive = true
        smsLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        registrationButton.topAnchor.constraint(equalTo: telephoneTextField.bottomAnchor, constant: 100).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registrationButton.leadingAnchor.constraint(equalTo: telephoneTextField.leadingAnchor).isActive = true
        registrationButton.trailingAnchor.constraint(equalTo: telephoneTextField.trailingAnchor).isActive = true
        
    }
    
    //Selectors
    
    @objc func registrationButtonTapped() {
        self.output?(.registrationButton)
    }
    
    @objc func backButtonPressed() {
        self.output?(.backButton)
    }
    
}




