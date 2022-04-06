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
//    case white
    case background0
//    case background1
//    case background2
//    case background3
    case label0
//    case label1
//    case label2
//    case label3
    
    var color: UIColor {
        switch self {
//        case .white:
        case .background0:
            return UIColor(rgb: 0x333333)
//        case .background1:
//            <#code#>
//        case .background2:
//            <#code#>
//        case .background3:
//            <#code#>
        case .label0:
            return UIColor(rgb: 0x99cc66)
//        case .label1:
//            <#code#>
//        case .label2:
//            <#code#>
//        case .label3:
//            <#code#>
        }
    }
}
