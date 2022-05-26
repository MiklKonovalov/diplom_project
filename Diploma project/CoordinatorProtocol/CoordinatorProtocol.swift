//
//  CoordinatorProtocol.swift
//  Diploma project
//
//  Created by Misha on 19.05.2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get }
    var childCoordinators: [CoordinatorProtocol] { get }
    func start()
}

