//
//  AddExpandedCellDelegate.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import Foundation

protocol AddExpandedCellDelegate : class {
    func writeDescription(sectionIndex: Int, desc: String)
    func clickSafteyButton(sectionIndex: Int, grade: SafetyGrade)
}
