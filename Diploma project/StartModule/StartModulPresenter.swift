//
//  RegistrationModulPresenter.swift
//  Diploma project
//
//  Created by Misha on 23.05.2022.
//

import Foundation
import UIKit

class StartModulPresenter: StartModulPresenterProtocol {
    
    var navigationController: UINavigationController
    var coordinator: CoordinatorProtocol?
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        coordinator = AuthorizationCoordinator(navigationController: navigationController)
        
    }
    
    //Functions
    
    func openNextScreen() {
        coordinator?.start()
    }
    
}
