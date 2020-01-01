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
    func configure(data: Place) {
        nameLabel.text = data.name
        pkLabel.text = data.pk
        infoLabel.text = data.info
        gradeLabel.text = data.grade.name
        gradeImageView.image = data.grade.colorImage
    }
}
