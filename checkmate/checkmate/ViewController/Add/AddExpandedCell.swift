//
//  AddExpandedCell.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class AddExpandedCell: UITableViewCell, NibLoadable {
    var selectedGrade : SafetyGrade = .unknown
    var sectionIndex: Int?
    @IBOutlet weak var safeButton: RoundButton!
    @IBOutlet weak var warnButton: RoundButton!
    @IBOutlet weak var dangerButton: RoundButton!
    @IBOutlet weak var descTextView: UITextView!
    weak var addExpandedCellDelegate: AddExpandedCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descTextView.delegate = self
    }
    
    func configure(sectionIndex: Int, safetyGrade: SafetyGrade, data: ExpandCellData) {
        self.sectionIndex = sectionIndex
        selectedGrade = data.safetyGrade
        descTextView.text = data.desc
        changeButtonColor(selectedGrade: data.safetyGrade)
        
    }
    
    func changeButtonColor(selectedGrade: SafetyGrade) {
        safeButton.backgroundColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)
        warnButton.backgroundColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)
        dangerButton.backgroundColor = #colorLiteral(red: 0.9906734824, green: 0.990696609, blue: 0.9906842113, alpha: 1)
        switch selectedGrade {
        case .safe:
            safeButton.backgroundColor = #colorLiteral(red: 0, green: 0.462745098, blue: 1, alpha: 1)
        case .warn:
            warnButton.backgroundColor = #colorLiteral(red: 1, green: 0.8078431373, blue: 0, alpha: 1)
        case .danger:
            dangerButton.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        default:
            break
        }
    }
    
    @IBAction func selectButton(_ sender: RoundButton) {
        selectedGrade = SafetyGrade(rawValue: sender.tag) ?? .unknown
        changeButtonColor(selectedGrade: selectedGrade)
        if let sectionIndex = sectionIndex {
            addExpandedCellDelegate?.clickSafteyButton(sectionIndex: sectionIndex, grade: selectedGrade)
        }
    }
}

extension AddExpandedCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let sectionIndex = sectionIndex {
            addExpandedCellDelegate?.writeDescription(sectionIndex: sectionIndex, desc: textView.text)
        }
    }
}
