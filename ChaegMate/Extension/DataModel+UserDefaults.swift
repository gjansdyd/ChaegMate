//
//  DataModel+UserDefaults.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation

class UserData {
    static var loginId: String {
        get { return UserDefaults.standard.string(forKey: "LoginId") ?? "" }
        set(val) { UserDefaults.standard.setValue(val, forKey: "LoginId") }
    }
    
    static var loginToken : String {
        get { return UserDefaults.standard.string(forKey: "LoginToken") ?? "" }
        set(val) { UserDefaults.standard.setValue(val, forKey: "LoginToken") }
    }
    
    static var isLeftHandType : Bool {
        get { return UserDefaults.standard.bool(forKey: "IsLeftHandType") ?? false }
        set(val) { UserDefaults.standard.set(val, forKey: "IsLeftHandType") }
    }
}
