//
//  PresenterProtocol.swift
//  Diploma project
//
//  Created by Misha on 19.05.2022.
//

import Foundation
import UIKit

protocol PresenterProtocol: AnyObject {
    
    var navigationController: UINavigationController { get set }
    var coordinator: CoordinatorProtocol? { get set }
    //var output: ((StartViewControllerButton) -> Void)? { get set }
}
