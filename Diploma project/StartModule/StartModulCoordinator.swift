//
//  RegistrationCoordinator.swift
//  Diploma project
//
//  Created by Misha on 18.05.2022.
//

import Foundation
import UIKit

final class StartCoordinator: CoordinatorProtocol {
        
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    var presenter: StartModulPresenter?
    
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        presenter = StartModulPresenter(navigationController: navigationController)
    }
    
    //Functions

    func start() {
        let startViewController = StartViewController(startModulPresenter: presenter!)
        
        
        presenter?.output = { [weak self] action in
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
        let registrationModulPresenter = RegistrationModulPresenter(navigationController: navigationController)
        let registrationViewController = RegistrationViewController(registrationModulPresenter: registrationModulPresenter)
        registrationViewController.view.backgroundColor = .white
        self.navigationController.pushViewController(registrationViewController, animated: true)
    }
    
    private func showLoginViewController() {
        let loginModulPresenter = LoginModulPresenter(navigationController: navigationController)
        let loginViewController = LoginViewController(loginModulPresenter: loginModulPresenter)
        loginViewController.view.backgroundColor = .white
        self.navigationController.pushViewController(loginViewController, animated: true)
    }
}
