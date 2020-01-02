//
//  ExpandedCell.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class ExpandedCell: UITableViewCell, NibLoadable {
    static let ID = "ExpandedCell"
//
   @IBOutlet var titleLabel: UILabel!
    func configure(data: ExpandCellData) {
        titleLabel.text = data.desc
    }
}
