//
//  LoginViewController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import UIKit
import GoogleSignIn
import AuthenticationServices

class LoginViewController: BaseViewController {
    @IBOutlet private weak var loginButtonsStackView: UIStackView!
    @IBOutlet private weak var noLoginBtnOutlet: UIButton!
    @IBAction func noLoginBtnAction(_ sender: UIButton) { goToMain() }
    private var loginController: LoginController?
    override func viewDidLoad() {
        super.viewDidLoad()
        setGoogleLoginButton()
        setAppleLoginButton()
        setNoLoginButton()
    }
}

//Detail UI
extension LoginViewController {
    private func setGoogleLoginButton() {
        let googleLoginButton = UIButton()
        googleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        setButton(button: googleLoginButton,
                  title: "Google로 로그인", titleColor: Theme.label5.color,
                  back: Theme.label0.color, imgName: "GoogleLogin")
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
                  titleColor: Theme.label0.color, back: Theme.label5.color,
                  imgName: "AppleLogin")
        button.addAction(action, for: .touchUpInside)
        self.loginController = appleLoginController
    }
    
    private func setNoLoginButton(){
        let attributedString = "로그인 없이 앱 시작".rangeSetUnderline(color: Theme.labelBlue.color, range: "로그인 없이 앱 시작")
        noLoginBtnOutlet.titleLabel?.attributedText = attributedString
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
        switch value {
        case .success:
            UserData.loginId = userInfo?.userIdentifer ?? ""
            UserData.loginToken = userInfo?.token ?? ""
            
            DispatchQueue.main.async { self.chooseHandType() }
        case .fail:
            DispatchQueue.main.async { self.showAlertView(errorPrint ?? "") }
        }
    }
    
    private func chooseHandType() {
        let alertVC = UIAlertController(title: "손잡이 확인", message: "당신은 왼손잡이인가요? 오른손잡이인가요?", preferredStyle: .alert)
        let leftBtn = UIAlertAction(title: "왼손", style: .default) { _ in
            UserData.isLeftHandType = true
            self.goToMain()
        }
        let rightBtn = UIAlertAction(title: "오른손", style: .default) { _ in
            UserData.isLeftHandType = false
            self.goToMain()
        }
        alertVC.addAction(leftBtn)
        alertVC.addAction(rightBtn)
        present(alertVC, animated: true)
    }
    
    private func showAlertView(_ errMsg: String) {
        let alertVC = UIAlertController(title: "로그인 오류", message: "로그인에 실패하였습니다.\n\(errMsg)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
