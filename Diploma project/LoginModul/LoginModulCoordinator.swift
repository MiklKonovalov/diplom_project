//
//  LoginModulCoordinator.swift
//  Diploma project
//
//  Created by Misha on 24.05.2022.
//

import Foundation
import UIKit

final class LoginModulCoordinator: LoginCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    let presenter: PresenterProtocol?
    private let factory: LoginFactory
    
    //Init
    
    init(navigationController: UINavigationController, factory: LoginFactory) {
        self.navigationController = navigationController
        self.factory = factory
        
        presenter = ConfirmModulPresenter(navigationController: navigationController)
    }
    
    func start() {
        let confirmViewController = ConfirmViewController(confirmModulPresenter: presenter as! ConfirmModulPresenter)
        
        confirmViewController.output = { [weak self] action in
            switch action {
            
            case .backButton:
                self?.navigationController.dismiss(animated: true, completion: nil)
                self?.navigationController.popViewController(animated: true)
            
            case.registrationButton:
                if confirmViewController.telephoneTextField.text != nil {
                    let loginInspector = self?.factory.checkLoginByFactory()
                    print(loginInspector?.checkLogin(message: confirmViewController.telephoneTextField.text ?? " "))
                    
                } else {
                    print("PLEASE INPUT TEXT")
                }
            }
            
        }
        
        confirmViewController.view.backgroundColor = .white
        navigationController.pushViewController(confirmViewController, animated: true)
    }
    
}
