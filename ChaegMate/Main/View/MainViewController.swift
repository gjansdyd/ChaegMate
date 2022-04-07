//
//  MainViewController.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation
import UIKit

class MainViewController: BaseViewController {
    @IBOutlet private weak var topView: UIView!
    @IBOutlet private weak var contentView: UIView!
    private weak var floationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.backgroundColor = .clear
        setTopView()
        setFloatingButton()
    }
    
    private func goToMyPage() -> UIAction? {
        guard let vc = UIStoryboard(name: StoryBoard.myPage.identifier, bundle: nil)
                        .instantiateViewController(withIdentifier: MyPageViewController.identifier)
                as? MyPageViewController else { return nil }
        return UIAction { _ in self.present(vc, animated: true) }
    }
}

//MARK: UI Set
extension MainViewController {
    private func setTopView() {
        topView.backgroundColor = .clear
        
        let titleLabel = UILabel()
        let titleImg = UIImageView()
        let myPageButton = UIButton()
        let lineView = UIView()
        self.topView.addSubviews(titleLabel, titleImg, myPageButton, lineView)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.topView.leftAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: self.topView.centerYAnchor, constant: -8),
            
            titleImg.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 8),
            titleImg.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            titleImg.heightAnchor.constraint(equalToConstant: 33),
            titleImg.widthAnchor.constraint(equalToConstant: 33),
            
            myPageButton.rightAnchor.constraint(equalTo: self.topView.rightAnchor, constant: -20),
            myPageButton.centerYAnchor.constraint(equalTo: self.topView.centerYAnchor, constant: -8),
            myPageButton.heightAnchor.constraint(equalToConstant: 30),
            myPageButton.widthAnchor.constraint(equalToConstant: 30),
            
            lineView.bottomAnchor.constraint(equalTo: self.topView.bottomAnchor),
            lineView.leftAnchor.constraint(equalTo: self.topView.leftAnchor, constant: 20),
            lineView.rightAnchor.constraint(equalTo: self.topView.rightAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        let title = "책's Mate"
        titleLabel.attributedText = title.rangeBoldString(30, range: title)
            .rangeSetColor(color: Theme.label3.color, str: "책")
        titleImg.image = UIImage(systemName: "bookmark")?.withTintColor(Theme.label0.color)
        myPageButton.setImage(UIImage(systemName: "person"), for: .normal)
        myPageButton.layer.cornerRadius = 15
        myPageButton.layer.borderWidth = 2
        myPageButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        lineView.backgroundColor = Theme.background0.color.withAlphaComponent(0.7)
        
        guard let action = goToMyPage() else { return }
        myPageButton.addAction(action, for: .touchUpInside)
    }
    
    private func setFloatingButton() {
        let button = UIButton()
        self.view.addSubviews(button)
        button.backgroundColor = .green
        
        let layoutConstraint: NSLayoutConstraint
        if UserData.isLeftHandType {
            layoutConstraint = button.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 50)
        } else {
            layoutConstraint = button.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -50)
        }
        NSLayoutConstraint.activate([
            layoutConstraint,
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 66),
            button.heightAnchor.constraint(equalToConstant: 66),
        ])
        self.floationButton = button
    }
}
