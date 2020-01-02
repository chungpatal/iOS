//
//  ExpandableCell.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class ExpandableCell2: UITableViewCell, NibLoadable {
    static let ID = "ExpandableCell2"
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var moreLabel: UILabel!
    @IBOutlet weak var saftyGradeImageView: UIImageView!
    @IBOutlet weak var customArrowImage: UIImageView!
    
    func configure(data: ExpandCellData) {
        titleLabel.text = data.category.name
        changeCircleColor(selectedGrade: data.safetyGrade)
    }
    
   func changeCircleColor(selectedGrade: SafetyGrade) {
        switch selectedGrade {
        case .unknown:
            saftyGradeImageView.image = #imageLiteral(resourceName: "iconGray")
        case .safe:
            saftyGradeImageView.image = #imageLiteral(resourceName: "iconBlue")
        case .warn:
            saftyGradeImageView.image = #imageLiteral(resourceName: "iconYellow")
        case .danger:
            saftyGradeImageView.image = #imageLiteral(resourceName: "iconRed")
        }
    }
}
