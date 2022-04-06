//
//  BaseViewController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation
import UIKit
class BaseViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    internal func goToMain() {
        guard let vc = UIStoryboard(name: StoryBoard.main.identifier, bundle: nil)
                        .instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController
        else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
