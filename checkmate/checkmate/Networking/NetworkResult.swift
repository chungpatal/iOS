//
//  NetworkResult.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/12.
//  Copyright © 2020 강수진. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case networkConnectFail
    case networkError((resCode : Int, msg : String))
}
