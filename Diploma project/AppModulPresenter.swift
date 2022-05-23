//
//  RegistrationModulPresenter.swift
//  Diploma project
//
//  Created by Misha on 19.05.2022.
//

import Foundation
import UIKit

class AppModulPresenter: AppModulPresenterProtocol {
    
    var coordinator: CoordinatorProtocol?
    
    var navigationController: UINavigationController
    
    var presenter: PresenterProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        presenter = StartModulPresenter(navigationController: navigationController)
    }
    
    func openNextScreen() {
        let authViewController = StartViewController(startModulPresenter: presenter as! StartModulPresenter)
        authViewController.view.backgroundColor = .white
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(authViewController, animated: true)
    }
    
}
