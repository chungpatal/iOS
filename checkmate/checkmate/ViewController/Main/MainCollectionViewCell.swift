//
//  MainCollectionViewCell.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell, NibLoadable {
    @IBOutlet weak var shadowBackgroundView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    func configure(data: Category) {
        self.categoryImageView.image = data.icon
        self.categoryName.text = data.name
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    func setUI() {
        shadowBackgroundView.makeRounded(cornerRadius: 8)
        shadowBackgroundView.addShadow(offset: CGSize(width: 6, height: 6), color: .black, radius: 6, opacity: 0.01)
    }
}
