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
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

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
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(sigInButton)
        view.addSubview(errorMessageLabel)
        
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
        
        // error label
        NSLayoutConstraint.activate([
            errorMessageLabel.leadingAnchor.constraint(equalTo: sigInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: sigInButton.trailingAnchor),
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: sigInButton.bottomAnchor, multiplier: 2)
        ])
    }
}

//MARK: Action

extension LoginViewController {
    
    @objc func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank")
            return
        }
        
        if username == "Lana" && password == "uikit" {
            sigInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

