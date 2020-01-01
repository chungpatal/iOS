//
//  Storyboard+Extension.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

extension UIStoryboard {
    func viewController<T>(_ type: T.Type) -> T where T: NibLoadable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.nibId) as? T else {
            fatalError("Could not find viewController \(T.nibId)")
        }
        return viewController
    }
}
