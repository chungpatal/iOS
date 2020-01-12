//
//  AlertUsable.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/12.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

protocol AlertUsable: UIPresentable {
    func showSimpleAlert(title: String, message: String, okHandler: ((UIAlertAction) -> Void)?)
}

extension AlertUsable {
    func showSimpleAlert(title: String, message: String, okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okTitle = "확인"
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okHandler)
        alert.addAction(okAction)
        self.viewController.present(alert, animated: true)
    }
    func showSimpleActionSheet(title: String?,
                           message: String?,
                           okTitle: String,
                           actions: [[String: ((UIAlertAction) -> Void)?]],
                           okHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (action) in actions {
            for (key, value) in action {
                alert.addAction(UIAlertAction(title: key, style: .default, handler: value))
            }
        }
        let cancleAction = UIAlertAction(title: okTitle, style: .cancel)
        alert.addAction(cancleAction)
        self.viewController.present(alert, animated: true)
    }
}

extension AlertUsable {
    func showErrorAlert(errorType : NetworkError){
        switch errorType {
        case .networkConnectFail:
            self.showSimpleAlert(title: "오류", message: "네트워크 상태를 확인해주세요")
        case .networkError(_, let msg):
            self.showSimpleAlert(title: "오류", message: msg)
        case .decodeError:
            self.showSimpleAlert(title: "오류", message: "디코딩에 실패했습니다. 다시 시도해주세요")
        }
    }
}
