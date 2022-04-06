//
//  DataModel+UserDefaults.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation

class UserData {
    static var loginToken : String {
        get { return UserDefaults.standard.string(forKey: "LoginToken") ?? "" }
        set(val) { UserDefaults.standard.setValue(val, forKey: "LoginToken") }
    }
}
