//
//  LoginController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation

class LoginController: NSObject{
    weak var delegate: LoginProtocol? {
        didSet { tryLogin() }
    }
    
    //override
    func tryLogin() { }
}
