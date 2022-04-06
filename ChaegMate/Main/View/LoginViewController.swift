//
//  LoginViewController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    var loginController: LoginController?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        self.view.backgroundColor = Theme.background0.color
        setGoogleLoginButton()
    }
}

//Detail UI
extension LoginViewController {
    private func setGoogleLoginButton() {
        let googleLoginButton = UIButton()
        googleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        googleLoginButton.setTitle("Google", for: .normal)
        googleLoginButton.setTitleColor(Theme.label0.color, for: .normal)
        self.view.addSubview(googleLoginButton)
        NSLayoutConstraint.activate([
            googleLoginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            googleLoginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        googleLoginButton.addAction(UIAction { _ in
            print(#function)
            self.loginController = GoogleLoginController()
            GIDSignIn.sharedInstance()?.presentingViewController = self
            self.loginController?.delegate = self
        }, for: .touchUpInside)
    }
    
    private func setAppleLoginButton() {
        let appleLoginButton = UIButton()
    }
}

extension LoginViewController: LoginProtocol {
    func after(_ value: AfterLogin) {
        //성공이냐 실패냐.
        if value == .success { }
        else { }
    }
}
