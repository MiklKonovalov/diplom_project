//
//  LoginViewController.swift
//  Diploma project
//
//  Created by Misha on 23.05.2022.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
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
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        view.addSubview(headLabel)
        view.addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    //Functions
    
    private func setupConstraints() {
        
        headLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        headLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        headLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 50).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
