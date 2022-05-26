//
//  ListViewController.swift
//  Diploma project
//
//  Created by Misha on 25.05.2022.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    
    //Lifecycle
    private let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.text = "UserName"
        label.textColor = .systemOrange
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        view.addSubview(userName)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        userName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        userName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
