//
//  ExpandableCell.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class ExpandableCell2: UITableViewCell, NibLoadable {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var moreLabel: UILabel!
    @IBOutlet weak var saftyGradeImageView: UIImageView!
    @IBOutlet weak var customArrowImage: UIImageView!
    
    func configure(data: ExpandCellData) {
        if data.opened {
            customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 1.0, 0.0, 0.0)
        } else {
            customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0.0, 0.0, 0.0)
        }
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
