//
//  ConfirmModulCoordinator.swift
//  Diploma project
//
//  Created by Misha on 25.05.2022.
//

import Foundation
import UIKit

class ConfirmModulCoordinator: ConfirmModulCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //Functions
    
    func start() {
        let listViewController = ListViewController()
        navigationController.pushViewController(listViewController, animated: true)
    }
    
    
}
