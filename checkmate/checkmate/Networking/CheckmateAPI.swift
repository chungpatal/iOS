//
//  CheckmateAPI.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/12.
//  Copyright © 2020 강수진. All rights reserved.
//

import Foundation
import Moya

enum CheckmateAPI {
    //장소 가져오기
    case placeList(categoryIdx: Int)
    //장소 상세보기
    case placeDetail(placeIdx: Int)
    //장소 추가 -> 여기서 geo 받나?
    case addPlace(place: PlaceDetail)
    //장소 수정
    case editPlace(place: PlaceDetail)
    //장소 검색
    case searchPlace(keyword: String)
    //주소 검색
    case searchAddress(keyword: String)
}

extension CheckmateAPI: TargetType {
    var baseURL: URL {
        let url: URL?
        switch self {
        case .searchAddress:
            url = URL(string: "http://www.juso.go.kr")
        default:
            url = URL(string: "http://15.165.96.154:3000")
        }
        guard let url_ = url else {
            fatalError("base url could not be configured")
        }
        return url_
    }
    var path: String {
        switch self {
        case .placeList(let categoryIdx):
            return "/place/list/\(categoryIdx)"
        case .placeDetail(let placeIdx):
            return "/place/detail/\(placeIdx)"
        case .addPlace:
            return "/place"
        case .editPlace:
            return "/place"
        case .searchPlace:
            return "/place/search"
        case .searchAddress:
            return "/addrlink/addrLinkApi.do"
        }
    }
    var method: Moya.Method {
        switch self {
        case .placeList, .placeDetail, .searchPlace:
            return .get
        case .addPlace:
            return .post
        case .editPlace:
            return .put
        case .searchAddress:
            return .get
        }
    }
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
        case .placeList, .placeDetail:
            return .requestPlain
        case .searchPlace(let keyword):
            let parameters: [String: Any] = ["q": keyword]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .addPlace(let place), .editPlace(let place):
            let detailInfo = place.detailInfo.map { detailInfo -> [String : Any] in
                let editedInfo: [String: Any] = ["category_idx": detailInfo.categoryIdx.rawVal,
                                                 "grade": detailInfo.grade.rawVal,
                                                 "detail":detailInfo.detail]
                return editedInfo
            }
            var parameters: [String: Any] = ["name": place.name ?? "",
                                             "address": place.address ?? "",
                                             "legal_name": place.legalName,
                                             "num": place.num,
                                             "pk": place.pk,
                                             "use_idx": place.useIdx.rawVal,
                                             "detail_info": detailInfo]
            if let placeIdx = place.placeIdx {
                parameters["place_idx"] = placeIdx
            }
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .searchAddress(let keyword):
            let parameters: [String: Any] = ["confmKey": jusoConfmKey,
                                             "currentPage": "1",
                                             "countPerPage": "100",
                                             "keyword": keyword,
                                             "resultType": "json"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    var validationType: ValidationType {
        return .successAndRedirectCodes
    }
    var headers: [String: String]? {
         return ["Content-type": "application/json"]
    }
}
