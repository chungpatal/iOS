//
//  UIPresentable.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/12.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

protocol UIPresentable: class {
    var viewController: UIViewController { get }
}

extension UIPresentable where Self: UIViewController {
    var viewController: UIViewController {
        return self
    }
}
