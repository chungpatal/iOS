//
//  PlaceInfo.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/01.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

struct PlaceInfoModel: Codable {
    let message: String
    let data: [Place]
}

struct Place: Codable {
    let placeIdx: Int
    let name, pk, info: String
    let grade: SafetyGrade

    enum CodingKeys: String, CodingKey {
        case placeIdx = "place_idx"
        case name, pk, info, grade
    }
}


enum SafetyGrade: Int, Codable {
    case safe = 0
    case warn = 1
    case danger = 2
    case unknown = 3
    
    var rawVal: Int {
        return self.rawValue
    }
    
    var name: String {
        switch self {
        case .safe:
            return "안전"
        case .warn:
            return "주의"
        case .danger:
            return "경고"
        default:
            return "미정"
        }
    }
    
    var colorImage: UIImage {
        switch self {
        case .safe:
            return #imageLiteral(resourceName: "iconBlue")
        case .danger:
            return #imageLiteral(resourceName: "iconRed")
        case .warn:
            return #imageLiteral(resourceName: "iconYellow")
        default:
            return UIImage()
        }
    }
}
