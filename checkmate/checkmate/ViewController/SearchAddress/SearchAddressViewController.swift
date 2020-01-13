//
//  SearchViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/03.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class SearchAddressViewController: UIViewController, NibLoadable {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    var searchResultPlaces: [Juso] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    var delegate: AddressDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setTableView()
        setupToHideKeyboardOnTapOnView()
        setTextField()
    }
    
    func setTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    func setTextField() {
        searchTextField.delegate = self
        searchTextField.returnKeyType = .done
    }
}

extension SearchAddressViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultPlaces.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(for: SearchAddressTableViewCell.self)
        cell.configure(row: indexPath.row, data: searchResultPlaces[indexPath.row])
        cell.selectButtonAction = { [unowned self] addressName in
            self.navigationController?.popViewController(completion: { [weak self] in
                guard let self = self else {return}
                self.delegate?.selectPlace(name: addressName)
            })
        }
        return cell
    }
}

extension SearchAddressViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchAddress(keyword: textField.text ?? "")
        textField.resignFirstResponder()
        return true
    }
}

// MARK: Network
extension SearchAddressViewController: AlertUsable {
    func searchAddress(keyword: String) {
        NetworkManager.sharedInstance.searchAddress(keyword: keyword) { [weak self] (res) in
            guard let self = self else { return }
            switch res {
            case .success(let data):
                if data.isEmpty {
                    self.showSimpleAlert(title: "일치하는 데이터가 없습니다", message: "")
                } else {
                    self.searchResultPlaces = data
                }
            case .failure(let type):
                self.showErrorAlert(errorType: type)
            }
        }
    }
}

protocol AddressDelegate {
    func selectPlace(name: String)
}

