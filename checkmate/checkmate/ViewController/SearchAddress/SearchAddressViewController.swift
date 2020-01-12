//
//  SearchViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/03.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class SearchAddressViewController: UIViewController, NibLoadable {
    //todo 키보드 처리
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    var searchResultPlaces: [String] = []
    var delegate: AddressDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setTableView()
        searchTextField.addTarget(self, action: #selector(writeKeyword), for: .editingChanged)
    }
    
    func setTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }

    @objc func writeKeyword() {
        //todo 주소 찾기 통신
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

protocol AddressDelegate {
    func selectPlace(name: String)
}
