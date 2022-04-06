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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.backgroundColor = .clear
        setTopView()
    }
    
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
    
    private func goToMyPage() -> UIAction? {
        let vc = UIStoryboard(name: StoryBoard.main.identifier, bundle: nil).instantiateViewController(withIdentifier: "MyPageViewController")
//        guard  else { return nil }
        return UIAction { _ in self.present(vc, animated: true) }
    }
}

