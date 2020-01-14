//
//  ExpandedCell.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class ExpandedCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var titleLabelHeight: NSLayoutConstraint!
    @IBOutlet var titleLabel: UILabel!
    func configure(data: String?) {
        titleLabel.text = data
        let estimatedHeight = titleLabel.text?.height(withConstrainedWidth:
            self.contentView.frame.width - 32, font:titleLabel.font) ?? 0
        titleLabelHeight.constant = estimatedHeight
    }
}
