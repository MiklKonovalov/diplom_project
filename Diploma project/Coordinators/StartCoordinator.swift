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
        
        presenter = AppModulPresenter(navigationController: navigationController)

    }
    
    //Functions

    func start() {
        presenter?.openNextScreen()
    }
    
}
