//
//  UICollectionView+Extension.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

extension UICollectionView {
    func cell<T: UICollectionViewCell>(type cellType: T.Type, for indexPath: IndexPath) -> T where T: NibLoadable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.nibId, for: indexPath) as? T else {
            fatalError("Could not find cell with reuseID \(T.nibId)")
        }
        return cell
    }
}
