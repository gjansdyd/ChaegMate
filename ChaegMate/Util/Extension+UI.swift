//
//  Extension+UI.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation
import UIKit

extension UIViewController {
    static var identifier: String {
        return self.description().components(separatedBy: ".").last ?? ""
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }

    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
    
    func getLineColor() -> UIColor {
        return UIColor(rgb: 0xEEEEEE)
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
