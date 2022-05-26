//
//  RegistrationModulPresenter.swift
//  Diploma project
//
//  Created by Misha on 24.05.2022.
//

import Foundation
import UIKit

class RegistrationModulPresenter: RegistrationModulPresenterProtocol {
    
    var navigationController: UINavigationController
    var coordinator: CoordinatorProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        coordinator = LoginModulCoordinator(navigationController: navigationController, factory: LoginFactory())
    }
    
    func showNextScreen() {
        coordinator?.start()
    }
    
    func showPreviousScreen() {
        coordinator?.dismiss()
    }
    
}

extension CoordinatorProtocol {
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
        navigationController.popToRootViewController(animated: true)
    }
}
