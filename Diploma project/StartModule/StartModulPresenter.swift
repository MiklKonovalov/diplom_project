//
//  RegistrationModulPresenter.swift
//  Diploma project
//
//  Created by Misha on 23.05.2022.
//

import Foundation
import UIKit

enum StartViewControllerButton {
    case registrationButtonTapped
    case loginButtonTapped
}

class StartModulPresenter: StartModulPresenterProtocol {
    
    var navigationController: UINavigationController
    var coordinator: CoordinatorProtocol?
    var output: ((StartViewControllerButton) -> Void)?
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        coordinator = AuthorizationCoordinator(navigationController: navigationController)
    }
    
    //Functions
    
    func openRegistrationScreen() {
        self.output?(.registrationButtonTapped)
    }
    
    func openLoginScreen() {
        self.output?(.loginButtonTapped)
    }
    
}
