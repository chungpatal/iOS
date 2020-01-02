//
//  PlaceListTableViewCell.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class PlaceListTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var pkLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var gradeLabel: UILabel!
    @IBOutlet private weak var gradeImageView: UIImageView!
    func configure(category: Category, data: PlaceDetail) {
        nameLabel.text = data.name
        pkLabel.text = data.pk
        infoLabel.text = "\(data.legalName+"/"+data.num)"
        if category == .all {
            gradeLabel.text = data.totalGrade.name
            gradeImageView.image = data.totalGrade.colorImage
        } else {
            let categoryGrade = data.detailInfo.filter { (detailInfo) in
                return detailInfo.categoryIdx == category
                }.first?.grade
            gradeLabel.text = categoryGrade?.name
            gradeImageView.image = categoryGrade?.colorImage
        }
    }
}
