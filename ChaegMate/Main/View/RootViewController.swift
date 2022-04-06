//
//  RootViewController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation
import UIKit

class RootViewController: BaseViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserData.loginId.isEmpty, UserData.loginToken.isEmpty {
            self.goToLoginVC()
        } else {
            self.goToMain()
        }
    }
    
    private func goToLoginVC() {
        guard let vc = UIStoryboard(name: StoryBoard.main.identifier, bundle: nil)
                        .instantiateViewController(withIdentifier: LoginViewController.identifier) as? LoginViewController
        else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
