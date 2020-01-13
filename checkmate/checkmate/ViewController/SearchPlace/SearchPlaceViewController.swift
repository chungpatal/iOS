//
//  SearchPlaceViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/03.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class SearchPlaceViewController: UIViewController, NibLoadable {

    @IBOutlet private weak var tableView: UITableView?
    @IBOutlet weak var highOrderButton: UIButton!
    @IBOutlet weak var lowOrderButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    var keyword: String?
    var order: Order = .high {
        didSet {
            places = sortPlacesOrder(places: places, by: order)
        }
    }
    var places: [Place] = [] {
        didSet {
            self.tableView?.reloadData()
        }
    }
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setNavigation()
        setTextField()
        setupToHideKeyboardOnTapOnView()
        order = .high
        if let keyword = keyword {
            searchTextField.text = keyword
            searchPlace(keyword: keyword)
        }
    }
    
    func sortPlacesOrder(places: [Place], by order: Order) -> [Place] {
        var places = places
        if order == .high {
            places.sort {
                return $0.grade.rawVal > $1.grade.rawVal
            }
        } else {
            places.sort {
                return $0.grade.rawVal < $1.grade.rawVal
            }
        }
        return places
    }
    
    
    func setTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    func setTextField() {
        searchTextField.delegate = self
        searchTextField.returnKeyType = .done
    }
    
    @IBAction func highOrder(_ sender: Any) {
        order = .high
        highOrderButton.setTitleColor(#colorLiteral(red: 0, green: 0.462745098, blue: 1, alpha: 1), for: .normal)
        lowOrderButton.setTitleColor(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
        
    }
    @IBAction func lowOrder(_ sender: Any) {
        order = .low
        lowOrderButton.setTitleColor(#colorLiteral(red: 0, green: 0.462745098, blue: 1, alpha: 1), for: .normal)
        highOrderButton.setTitleColor(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
    }
}

extension SearchPlaceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(for: PlaceListTableViewCell.self)
        cell.configure(category: .all, data: places[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let allDetailVC = mainStoryboard.viewController(AllDetailViewController.self)
        allDetailVC.selectedPlaceIdx = places[indexPath.row].placeIdx
        self.show(allDetailVC, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchPlaceViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchPlace(keyword: textField.text ?? "")
        return true
    }
}

// MARK: Network
extension SearchPlaceViewController: AlertUsable {
    func searchPlace(keyword: String) {
        print(keyword)
        NetworkManager.sharedInstance.searchPlace(keyword: keyword) { [weak self] (res) in
            guard let self = self else { return }
            switch res {
            case .success(let data):
                if data.isEmpty {
                    self.showSimpleAlert(title: "일치하는 데이터가 없습니다", message: "")
                } else {
                    self.places = self.sortPlacesOrder(places: data, by: self.order)
                }
            case .failure(let type):
                self.showErrorAlert(errorType: type)
            }
        }
    }
}

enum Order {
    case high
    case low
}
