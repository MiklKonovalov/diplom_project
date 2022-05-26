//
//  ConfirmModulCoordinator.swift
//  Diploma project
//
//  Created by Misha on 25.05.2022.
//

import Foundation
import UIKit

class ConfirmModulPresenter: ConfirmPresenterProtocol {

    var navigationController: UINavigationController
    var coordinator: CoordinatorProtocol?
    
    //Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        coordinator = ConfirmModulCoordinator(navigationController: navigationController)
        
    }
    
    func showNextScreen() {
        
        
    }
}


