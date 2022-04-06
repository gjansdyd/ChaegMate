//
//  LoginViewController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import UIKit
import GoogleSignIn
import AuthenticationServices

class LoginViewController: UIViewController {
    @IBOutlet private weak var loginButtonsStackView: UIStackView!
    var loginController: LoginController?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        self.view.backgroundColor = Theme.background0.color
        setGoogleLoginButton()
        setAppleLoginButton()
    }
}

//Detail UI
extension LoginViewController {
    private func setGoogleLoginButton() {
        let googleLoginButton = UIButton()
        googleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        setButton(button: googleLoginButton,
                  title: "Google로 로그인", titleColor: Theme.black.color,
                  back: Theme.white.color, imgName: "GoogleLogin")
        self.loginButtonsStackView.addArrangedSubview(googleLoginButton)
    
        googleLoginButton.addAction(UIAction { _ in
            print(#function)
            self.loginController = GoogleLoginController()
            GIDSignIn.sharedInstance()?.presentingViewController = self
            self.loginController?.delegate = self
        }, for: .touchUpInside)
    }
    
    private func setAppleLoginButton() {
        print(#function)
        let appleLoginController = AppleLoginController()
        appleLoginController.delegate = self
        guard let action = appleLoginController.action else { return }
        
        let button = UIButton()
        NSLayoutConstraint.activate([])
        self.loginButtonsStackView.addArrangedSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        setButton(button: button, title: "Apple로 로그인",
                  titleColor: Theme.white.color, back: Theme.black.color,
                  imgName: "AppleLogin")
        button.addAction(action, for: .touchUpInside)
        self.loginController = appleLoginController
    }
    
    private func setButton(button: UIButton, title: String, titleColor: UIColor, back: UIColor, imgName: String) {
        button.layer.cornerRadius = 12
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = back
        button.setImage(UIImage(named: imgName), for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 45)
        button.layer.cornerRadius = 18
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth  = 0.7
    }
}

extension LoginViewController: LoginProtocol {
    func after(_ value: AfterLogin, _ userInfo: LoginUserInfo?, _ errorPrint: String?) {
        
    }
}
