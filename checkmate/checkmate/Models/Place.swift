//
//  PlaceInfo.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/01.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

struct PlaceModel: Codable {
    let message: String
    let data: [Place]
}

struct Place: Codable {
    let placeIdx: Int
    var name: String?
    let pk, info: String
    let grade: SafetyGrade

    enum CodingKeys: String, CodingKey {
        case placeIdx = "place_idx"
        case name, pk, info, grade
    }
}


enum SafetyGrade: Int, Codable {
    case danger = 0
    case warn = 1
    case safe = 2
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
        case .unknown:
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
        case .unknown:
            return #imageLiteral(resourceName: "iconGray")
        }
    }
}
