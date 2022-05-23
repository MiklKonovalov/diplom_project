//
//  ViewController.swift
//  Diploma project
//
//  Created by Misha on 17.05.2022.
//

import UIKit

enum StartViewControllerButton {
    case registrationButtonTapped
    case loginButtonTapped
}

protocol ButtonTapProtocol {
    func registrationButtonPressed()
    func loginButtonPressed()
}

class StartViewController: UIViewController {

    //MARK: -Properties
    
    let startModulPresenter: StartModulPresenter
    
    var output: ((StartViewControllerButton) -> Void)?
    
    var delegate: ButtonTapProtocol?
    
    private var coverImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Cover")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        }()
    
    private var signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Зарегистрироваться", for: .normal)
        button.layer.backgroundColor = UIColor.systemGray.cgColor
        button.addTarget(self, action: #selector(registrationButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("У меня уже есть аккаунт", for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: -Initialization

    init(startModulPresenter: StartModulPresenter) {
        self.startModulPresenter = startModulPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(coverImageView)
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        setupConstraints()
    }

    //MARK: -Constraints
    
    private func setupConstraints() {
        
        coverImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        coverImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        coverImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 100).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        logInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 50).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //MARK: -Selectors
    
    @objc func registrationButtonPressed() {
        startModulPresenter.openNextScreen()
        delegate?.registrationButtonPressed()
        self.output?(.registrationButtonTapped)
    }

    @objc func loginButtonPressed() {
        delegate?.loginButtonPressed()
        startModulPresenter.openNextScreen()
        self.output?(.loginButtonTapped)
    }
}

