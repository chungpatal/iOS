//
//  Address.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/13.
//  Copyright © 2020 강수진. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Address: Codable {
    let results: Results
}

// MARK: - Results
struct Results: Codable {
    let common: Common
    let juso: [Juso]?
}

// MARK: - Common
struct Common: Codable {
    let errorMessage, countPerPage, totalCount, errorCode: String
    let currentPage: String
}

// MARK: - Juso
struct Juso: Codable {
    let roadAddr: String

    enum CodingKeys: String, CodingKey {
        case roadAddr
    }
}
