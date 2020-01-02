//
//  PlaceDetail.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/01.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

struct PlaceDetailModel: Codable {
    let message: String
    let data: PlaceDetail
}

struct PlaceDetail: Codable {
    let placeIdx: Int
    let name: String
    let address: String
    let totalGrade: SafetyGrade
    let legalName, num: String
    let useIdx: Int
    let pk: String
    let detailInfo: [DetailInfo]

    enum CodingKeys: String, CodingKey {
        case placeIdx = "place_idx"
        case name
        case address
        case totalGrade = "total_grade"
        case legalName = "legal_name"
        case num
        case useIdx = "use_idx"
        case pk
        case detailInfo = "detail_info"
    }
}

struct DetailInfo: Codable {
    let categoryIdx: Category
    let grade: SafetyGrade
    let detail: String

    enum CodingKeys: String, CodingKey {
        case categoryIdx = "category_idx"
        case grade, detail
    }
}

enum Category: Int, Codable, CaseIterable {
    case all = 0
    case facility = 1 //시설물
    case maintenance = 2 //유지관리
    case fire = 3//소방
    case gas = 4//가스
    case electronic = 5//전기
    case elevator = 6//승강기
    case building = 7//건축물
    
    var rawVal: Int {
        return self.rawValue
    }

    var name: String {
        switch self {
        case .all:
            return "모아보기"
        case .fire:
            return "소방"
        case .gas:
            return "가스"
        case .facility:
            return "시설물"
        case .maintenance:
            return "유지관리"
        case .electronic:
            return "전기"
        case .building:
            return "건축물"
        case .elevator:
            return "승강기"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .all:
            return #imageLiteral(resourceName: "iconAll")
        case .fire:
            return #imageLiteral(resourceName: "iconFire")
        case .gas:
            return #imageLiteral(resourceName: "iconGas")
        case .facility:
            return #imageLiteral(resourceName: "iconHouse")
        case .maintenance:
            return #imageLiteral(resourceName: "iconSetting")
        case .electronic:
            return #imageLiteral(resourceName: "iconElec")
        case .building:
            return #imageLiteral(resourceName: "iconArchi")
        case .elevator:
            return #imageLiteral(resourceName: "iconEle")
        }
    }
    
}
