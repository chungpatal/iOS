//
//  UIView+Extension.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

extension UIView {
//    func makeRounded(cornerRadius: CGFloat? = nil) {
//        if let cornerRadius = cornerRadius {
//            self.layer.cornerRadius = cornerRadius
//        } else {
//            self.layer.cornerRadius = self.layer.frame.height / 2
//        }
//        self.layer.masksToBounds = true
//    }
    func makeRounded(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        //self.contentView.clipsToBounds = true
    }
    func makeBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
