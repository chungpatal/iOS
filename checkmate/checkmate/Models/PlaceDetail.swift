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
    var placeIdx: Int
    let name: String?
    let address: String?
    let totalGrade: SafetyGrade
    let legalName, num: String
    let useIdx: PlaceUsage
    let pk: String
    let long: Double?
    let lat: Double?
    var detailInfo: [DetailInfo]

    enum CodingKeys: String, CodingKey {
        case placeIdx = "place_idx"
        case name
        case address
        case totalGrade = "grade"
        case legalName = "legal_name"
        case num
        case useIdx = "use_idx"
        case pk
        case long
        case lat
        case detailInfo = "detail_info"
    }
}

enum PlaceUsage:Int, Codable, CaseIterable {
    case liveTogeter = 1 //공동주택
    case factory = 2 //공장
    case study = 3//교육연구시설
    case etc = 4//기타
    case elder = 5//노유자시설
    case liveAlone = 6//단독주택
    case bed = 7 // 숙박시설
    case work = 8 //업무시설
    case hospital = 9 // 의료시설
    case car = 10 //자동차관련시설
    case first = 11//제1종근린생활시설
    case second = 12//제2종근린생활시설
    case church = 13 //종교시설
    case warehouse = 14  //창고시설
    
    var name : String{
        switch self {
        case .liveTogeter:
            return "공동주택"
        case .factory:
            return "공장"
        case .study:
            return "교육연구시설"
        case .etc:
            return "기타"
        case .elder:
            return "노유자시설"
        case .liveAlone:
            return "단독주택"
        case .bed:
            return "숙박시설"
        case .work:
            return "업무시설"
        case .hospital:
            return "의료시설"
        case .car:
            return "자동차관련시설"
        case .first:
            return "제1종근린생활시설"
        case .second:
            return "제2종근린생활시설"
        case .church:
            return "종교시설"
        case .warehouse:
            return "창고시설"
        @unknown default:
            return ""
        }
    }
    
    var rawVal: Int {
        return self.rawValue
    }
    
}

struct DetailInfo: Codable {
    var categoryIdx: Category
    var grade: SafetyGrade = .unknown
    var detail: String = ""

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
