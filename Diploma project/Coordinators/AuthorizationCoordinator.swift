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
    }
    
}
