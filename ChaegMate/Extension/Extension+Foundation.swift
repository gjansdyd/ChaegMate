//
//  Extension+Foundation.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation
import UIKit

extension String {
    func rangeBoldString(_ size: CGFloat, range: String) -> NSMutableAttributedString {
        let bold = UIFont.boldSystemFont(ofSize: size)
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.font, value: bold, range: (self as NSString).range(of: range))
        return attributedString
    }
    
    func rangeSizeUp(_ size: CGFloat, font: UIFont.Weight = .regular, range: String) -> NSMutableAttributedString {
        let bold = UIFont.systemFont(ofSize: size, weight: font)
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.font, value: bold, range: (self as NSString).range(of: range))
        return attributedString
    }
    
    func rangeSetColor(color: UIColor, range: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.foregroundColor, value: color, range: (self as NSString).range(of: range))
        return attributedString
    }
    
    func rangeSetUnderline(color: UIColor, range: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.foregroundColor, value: color, range: (self as NSString).range(of: range))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue,
                                    range: (self as NSString).range(of: range))
        // Add other attributes if needed
        return attributedString
    }
}

extension NSMutableAttributedString {
    func rangeBoldString(_ size: CGFloat, str: String) -> NSMutableAttributedString {
        let bold = UIFont.boldSystemFont(ofSize: size)
        self.addAttribute(.font, value: bold, range: (str as NSString).range(of: str))
        return self
    }
    
    func rangeSizeUp(_ size: CGFloat, font: UIFont.Weight = .regular, str: String) -> NSMutableAttributedString {
        let bold = UIFont.systemFont(ofSize: size, weight: font)
        self.addAttribute(.font, value: bold, range: (str as NSString).range(of: str))
        return self
    }
    
    func rangeSetColor(color: UIColor, str: String) -> NSMutableAttributedString {
        self.addAttribute(.foregroundColor, value: color, range: (str as NSString).range(of: str))
        return self
    }
    
    func rangeSetUnderline(color: UIColor, str: String) -> NSMutableAttributedString {
        self.addAttribute(.foregroundColor, value: color, range: (str as NSString).range(of: str))
        self.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue,
                                    range: (str as NSString).range(of: str))
        // Add other attributes if needed
        return self
    }
}
