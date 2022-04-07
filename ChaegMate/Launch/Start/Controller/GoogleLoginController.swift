//
//  GoogleLoginController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation
import GoogleSignIn

enum AfterLogin {
    case success
    case fail
}

struct LoginUserInfo {
    let userIdentifer: String
    let token: String
    let email: String
}

protocol LoginProtocol: AnyObject {
    func after(_ value: AfterLogin, _ userInfo: LoginUserInfo?, _ errorPrint: String?)
}

class GoogleLoginController: LoginController {
    override func tryLogin() {
        print(#function)
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.signIn()    
    }
}

//MARK: Google Login
extension GoogleLoginController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else {
            let errorCode: String
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                errorCode = "The user has not signed in before or they have since signed out."
            } else {
                errorCode = error.localizedDescription
            }
            delegate?.after(.fail, nil, errorCode)
            return
        }
            
        // 사용자 정보 가져오기
        guard let userId = user.userID,
            let idToken = user.authentication.idToken,
              let email = user.profile.email
        else {
            delegate?.after(.fail, nil, "Error : User Data Not Found")
            return
        }
        
        delegate?.after(.success, LoginUserInfo(userIdentifer: userId, token: idToken, email: email), nil)
    }
        
    // 구글 간편 로그아웃
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("Disconnect")
    }
}


