//
//  NibLoadable.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/01.
//  Copyright © 2020 강수진. All rights reserved.
//

import Foundation

protocol NibLoadable: class {
    static var nibId: String { get }
}

extension NibLoadable {
    static var nibId: String {
        return String(describing: self)
    }
    var nidId: String {
        return String(describing: type(of: self))
    }
}
