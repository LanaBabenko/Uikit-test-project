//
//  ViewController.swift
//  Barkey
//
//  Created by Svetlana Babenko on 05.01.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let sigInButton = UIButton(type: .system)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
       
    }

}

extension LoginViewController {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        sigInButton.translatesAutoresizingMaskIntoConstraints = false
        sigInButton.configuration = .filled()
        sigInButton.configuration?.imagePadding = 8
        sigInButton.setTitle("Sign In", for: [])
        sigInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(sigInButton)
        
        //LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // SignInButton
        NSLayoutConstraint.activate([
            sigInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            sigInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            sigInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2)
        ])
    }
}

//MARK: Action

extension LoginViewController {
    
    @objc func signInTapped() {
        
    }
}

