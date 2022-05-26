//
//  LoginModulPresenter.swift
//  Diploma project
//
//  Created by Misha on 23.05.2022.
//

import Foundation
import UIKit

final class LoginModulPresenter: LoginModulPresenterProtocol {
    
    var navigationController: UINavigationController
    var coordinator: CoordinatorProtocol?
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        coordinator = LoginModulCoordinator(navigationController: navigationController, factory: LoginFactory())
    }
    
    //Functions
    
    func showNextScreen() {
        coordinator?.start()
    }
    
}

