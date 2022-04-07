//
//  AppleLoginController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation
import AuthenticationServices

class AppleLoginController: LoginController {
    internal var action: UIAction?

    override func tryLogin() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        self.action = UIAction { _ in
            controller.performRequests()
        }
    }
}

extension AppleLoginController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let dataToken = credential.identityToken else {
            delegate?.after(.fail, nil, "Apple Login Error")
            return
        }
        
        let token = String(decoding: dataToken, as: UTF8.self)
        delegate?.after(.success, LoginUserInfo(userIdentifer: credential.user, token: token, email: credential.email ?? ""), nil)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        delegate?.after(.fail, nil, error.localizedDescription)
    }
}
