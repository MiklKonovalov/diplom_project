//
//  LoginFactory.swift
//  Diploma project
//
//  Created by Misha on 25.05.2022.
//

import Foundation

protocol LoginFactoryProtocol {
    func checkLoginByFactory() -> LoginInspector
}

class LoginFactory: LoginFactoryProtocol {
    func checkLoginByFactory() -> LoginInspector {
        return LoginInspector()
    }
}

class LoginInspector: ConfirmViewControllerProtocol {
            
    func checkLogin(message: String) -> User {
        
        let password = "123"
        let user = User(name: "Mikl")
        
        if message == password {
            return user
        } else {
            return User(name: "No name")
        }
    }
}
