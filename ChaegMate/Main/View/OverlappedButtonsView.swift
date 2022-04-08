//
//  OverlappedButtonsView.swift
//  ChaegMate
//
//  Created by linkshops on 2022/04/07.
//

import Foundation
import UIKit

class OverlappedButtonsView: UIView{
    private weak var backView: UIView!
    private weak var topBtn: UIButton!
    private weak var midBtn: UIButton!
    private weak var bottomBtn: UIButton!
    
    private weak var topBtnBottomAnchor: NSLayoutConstraint!
    private weak var midBtnBottomAnchor: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBack()
        setSubButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setBack()
        setSubButtons()
    }
    
    internal func updateUI(isHidden: Bool, updateDone: (() -> Void)? = nil) {
        midBtnBottomAnchor.isActive = false
        topBtnBottomAnchor.isActive = false
        
        let midMargin: CGFloat = isHidden ? 0 : -50
        let topMargin: CGFloat = isHidden ? 0 : -100
        
        midBtnBottomAnchor = midBtn.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: midMargin)
        topBtnBottomAnchor = topBtn.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: topMargin)
        midBtnBottomAnchor.isActive = true
        topBtnBottomAnchor.isActive = true
        
        
        UIView.animate(withDuration: 0.8, animations: {
            self.layoutIfNeeded()
        }, completion: { _ in updateDone?() })
    }
}

extension OverlappedButtonsView {
    private func setBack() {
        let view = UIView()
        self.addSubviews(view)
        view.backgroundColor = .brown
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leftAnchor.constraint(equalTo: self.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        backView = view
    }
    
    private func setSubButtons() {
        let topBtn = UIButton()
        let midBtn = UIButton()
        let bottomBtn = UIButton()
        
        backView.addSubviews(bottomBtn, midBtn, topBtn)
        let topBtnBottomAnchor = topBtn.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
        let midBtnBottomAnchor = bottomBtn.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topBtnBottomAnchor,
            topBtn.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            topBtn.heightAnchor.constraint(equalToConstant: 42),
            topBtn.widthAnchor.constraint(equalToConstant: 42),
            
            midBtnBottomAnchor,
            midBtn.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            midBtn.heightAnchor.constraint(equalToConstant: 42),
            midBtn.widthAnchor.constraint(equalToConstant: 42),
            
            bottomBtn.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            bottomBtn.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            bottomBtn.heightAnchor.constraint(equalToConstant: 42),
            bottomBtn.widthAnchor.constraint(equalToConstant: 42),
        ])
        
        topBtn.backgroundColor = .red
        midBtn.backgroundColor = .yellow
        bottomBtn.backgroundColor = .green
        
        topBtn.layer.cornerRadius = 21
        midBtn.layer.cornerRadius = 21
        bottomBtn.layer.cornerRadius = 21
        
        self.topBtn = topBtn
        self.midBtn = midBtn
        self.bottomBtn = bottomBtn
        
        self.topBtnBottomAnchor = topBtnBottomAnchor
        self.midBtnBottomAnchor = midBtnBottomAnchor
    }
}
