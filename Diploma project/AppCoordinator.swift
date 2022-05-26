//
//  AuthCoordinator.swift
//  Diploma project
//
//  Created by Misha on 17.05.2022.
//

import Foundation
import UIKit



final class AppCoordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol] = []
    var presenter: PresenterProtocol? 
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        childCoordinators.append(startCoordinator)
    }
    
    //Functions

    func start() {
        if !childCoordinators.isEmpty {
            childCoordinators.first?.start()
        }
    }
}
