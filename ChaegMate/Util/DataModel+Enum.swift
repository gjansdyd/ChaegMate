//
//  DataModel+Enum.swift
//  ChaegMate
//
//  Created by munyong on 2022/04/06.
//

import Foundation
import UIKit

enum StoryBoard: String {
    case main = "Main"
    var identifier: String { return self.rawValue }
}

enum Theme {
    case background0
//    case background1
//    case background2
//    case background3
    
    case label0
    case label1
    case label2
    case label3
    case label4
    case label5
    case labelBlue
    
    var color: UIColor {
        switch self {
        case .background0:
            return UIColor(rgb: 0x333333)
//        case .background1:
//            <#code#>
//        case .background2:
//            <#code#>
//        case .background3:
//            <#code#>
        case .label0:
            return UIColor(rgb: 0xFFFFFF)
        case .label1:
            return UIColor(rgb: 0xEEFFB7)
        case .label2:
            return UIColor(rgb: 0x99CC66)
        case .label3:
            return UIColor(rgb: 0x497B18)
        case .label4:
            return UIColor(rgb: 0x003300)
        case .label5:
            return UIColor(rgb: 0x000000)
        case .labelBlue:
            return UIColor.systemBlue
        }
    }
}
