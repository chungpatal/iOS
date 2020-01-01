//
//  UITableView+Extension.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/01.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

extension UITableView {
    func cell<T: UITableViewCell>(for cellType: T.Type) -> T where T: NibLoadable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.nibId) as? T else {
            fatalError("Could not find cell with reuseID \(T.nibId)")
        }
        return cell
    }
}
