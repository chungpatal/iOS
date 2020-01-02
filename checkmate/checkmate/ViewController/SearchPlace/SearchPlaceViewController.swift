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
    var keyword = "마포"

    var isOrderHigh = Bool() {
        didSet {
            sortPlaces()
        }
    }

    var places: [PlaceDetail] = [] {
        didSet {
            self.tableView?.reloadData()
        }
    }
    
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setNavigation()
        places = corePlace//지우기
        filterData(keyword: keyword)
        isOrderHigh = true
        searchTextField.text = keyword
    }
    
    func filterData(keyword: String){
        places = places.filter { (place) in
            return place.name.hasPrefix(keyword)
        }
    }
    func sortPlaces() {
        //sort
        if isOrderHigh {
            places.sort {
                if $0.totalGrade == .unknown {
                    return false
                }
                return $0.totalGrade.rawVal < $1.totalGrade.rawVal
            }
        } else {
            places.sort {
                if $0.totalGrade == .unknown {
                    return false
                }
                return $0.totalGrade.rawVal > $1.totalGrade.rawVal
            }
        }
    }
    
    func setTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    @IBAction func highOrder(_ sender: Any) {
        isOrderHigh = true
        highOrderButton.setTitleColor(#colorLiteral(red: 0, green: 0.462745098, blue: 1, alpha: 1), for: .normal)
        lowOrderButton.setTitleColor(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
        
    }
    @IBAction func lowOrder(_ sender: Any) {
        isOrderHigh = false
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
        allDetailVC.selectedPlace = places[indexPath.row]
        self.show(allDetailVC, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
