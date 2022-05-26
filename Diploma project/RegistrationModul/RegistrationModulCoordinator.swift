//
//  RegistrationModulCoordinator.swift
//  Diploma project
//
//  Created by Misha on 24.05.2022.
//

import Foundation
import UIKit

final class RegistrationModulCoordinator: RegistrationCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //Functions
    
    func start() {
        
    }
    
    
}
