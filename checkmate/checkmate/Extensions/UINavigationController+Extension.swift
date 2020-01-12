//
//  UINavigationController+Extension.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/12.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

extension UINavigationController {
    func popViewController(animated: Bool = true, completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
}
