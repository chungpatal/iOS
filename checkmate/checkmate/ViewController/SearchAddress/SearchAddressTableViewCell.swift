//
//  SearchTableViewCell.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/03.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class SearchAddressTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var addressLabel: UILabel!
    var selectButtonAction : ((String) -> ())?
    
    func configure(row: Int, data: String) {
        addressLabel.text = data
    }
    @IBAction func selectAddress(_ sender: Any) {
       selectButtonAction?(addressLabel.text ?? "")
    }
}
