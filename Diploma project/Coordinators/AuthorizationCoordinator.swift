//
//  RegistrationCoordinator.swift
//  Diploma project
//
//  Created by Misha on 23.05.2022.
//

import Foundation
import UIKit

class AuthorizationCoordinator: RegistrationCoordinatorProtocol {
    
    var presenter: PresenterProtocol?
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        presenter = StartModulPresenter(navigationController: navigationController)
        
        let startViewController = StartViewController(startModulPresenter: presenter as! StartModulPresenter)
        
        startViewController.output = { [weak self] action in
            switch action {
            case .registrationButtonTapped:
                self?.showRegistrationViewController()
            case .loginButtonTapped:
                self?.showLoginViewController()
            }
        }
    }
    
    private func showRegistrationViewController() {
        let registrationViewController = RegistrationViewController()
        registrationViewController.view.backgroundColor = .orange
        self.navigationController.pushViewController(registrationViewController, animated: true)
    }
    
    private func showLoginViewController() {
        let loginViewController = LoginViewController()
        loginViewController.view.backgroundColor = .orange
        self.navigationController.pushViewController(loginViewController, animated: true)
    }
}
