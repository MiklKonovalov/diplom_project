//
//  RegistrationCoordinator.swift
//  Diploma project
//
//  Created by Misha on 18.05.2022.
//

import Foundation
import UIKit

class StartCoordinator: LoginCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    var presenter: PresenterProtocol?
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        presenter = StartModulPresenter(navigationController: navigationController)

    }
    
    //Functions

    func start() {
        let startViewController = StartViewController(startModulPresenter: presenter as! StartModulPresenter)
        
        let startModulPresenter = StartModulPresenter(navigationController: navigationController)
        
        startModulPresenter.output = { [weak self] action in
            switch action {
            case .registrationButtonTapped:
                self?.showRegistrationViewController()
            case .loginButtonTapped:
                self?.showLoginViewController()
            }
        }
        
        startViewController.view.backgroundColor = .white
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(startViewController, animated: true)
    }
    
    private func showRegistrationViewController() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.view.backgroundColor = .white
        self.navigationController.pushViewController(registrationViewController, animated: true)
    }
    
    private func showLoginViewController() {
        let loginViewController = LoginViewController()
        loginViewController.view.backgroundColor = .white
        self.navigationController.pushViewController(loginViewController, animated: true)
    }
}
