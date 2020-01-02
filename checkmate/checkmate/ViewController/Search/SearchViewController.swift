//
//  SearchViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/03.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, NibLoadable {
    
    @IBAction func touch(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    var origianlPlaces = [
        "도화길 29-1",
        "도화길 27",
        "도화길 42",
        "도화길 14-1",
        "마포대로8길 9",
        "마포대로10길 12",
        "도화길 6",
        "마포대로6길 10",
        "만리재옛길 1",
        "만리재로 23"
    ]
    var places: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
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
        places = origianlPlaces.filter { (place) in
            return place.hasPrefix(searchTextField?.text ?? "")
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(for: SearchTableViewCell.self)
        cell.configure(row: indexPath.row, data: places[indexPath.row])
        return cell
    }
}
