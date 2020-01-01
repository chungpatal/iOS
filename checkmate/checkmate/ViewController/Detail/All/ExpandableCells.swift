//
//  ExpandableCells.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/01.
//  Copyright © 2020 강수진. All rights reserved.
//


import UIKit
import ExpandableCell


class ExpandableCell2: ExpandableCell {
    static let ID = "ExpandableCell2"
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var moreLabel: UILabel!
    @IBOutlet weak var saftyGradeImageView: UIImageView!
    @IBOutlet weak var customArrowImage: UIImageView!
    
}

class ExpandedCell: UITableViewCell, NibLoadable {
    static let ID = "ExpandedCell"
//
   @IBOutlet var titleLabel: UILabel!
}

