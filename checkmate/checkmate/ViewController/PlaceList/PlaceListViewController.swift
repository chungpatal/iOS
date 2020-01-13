//
//  PlaceListViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class PlaceListViewController: UIViewController, NibLoadable {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView?
    @IBOutlet weak var highOrderButton: UIButton!
    @IBOutlet weak var lowOrderButton: UIButton!
    var selectedCategory: Category? {
        didSet {
            if let selectedCategory = selectedCategory {
                getPlaceList(selectedCategory: selectedCategory)
            }
        }
    }

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
        setCollectionView()
        setTableView()
        selectInitialCategory()
        setNavigation()
        if let selectedCategory = selectedCategory {
            getPlaceList(selectedCategory: selectedCategory)
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
    
    func selectInitialCategory() {
        self.collectionView.selectItem(at: IndexPath(item: selectedCategory?.rawVal ?? 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        setCollectionViewLayout()
    }
    func setTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    func setCollectionViewLayout() {
        if let layout = collectionView.collectionViewLayout as? CategoryLayout {
            layout.delegate = self
        }
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

// MARK: CollectionView
extension PlaceListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cell(type: PlaceListCollectionViewCell.self, for: indexPath)
        cell.configure(data: categories[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        selectedCategory = categories[indexPath.row]
    }
}

// MARK: CollectionViewLayOutDelegate
extension PlaceListViewController: CategoryLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        widthForCategoryAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat(((categories[indexPath.item].name.count)*14)+24)
    }
}

// MARK: TableView
extension PlaceListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(for: PlaceListTableViewCell.self)
        if let selectedCategory = selectedCategory {
            cell.configure(category: selectedCategory, data: places[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let selectedCategory = selectedCategory else {
            return
        }
        let allDetailVC = mainStoryboard.viewController(AllDetailViewController.self)
        allDetailVC.selectedCategory = selectedCategory
        allDetailVC.selectedPlaceIdx = places[indexPath.row].placeIdx
        self.show(allDetailVC, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: Network
extension PlaceListViewController: AlertUsable {
    func getPlaceList(selectedCategory: Category) {
        NetworkManager.sharedInstance.getPlaceList(categoryIdx: selectedCategory.rawVal) { [weak self] (res) in
            guard let self = self else { return }
            switch res {
            case .success(let data):
                self.places = self.sortPlacesOrder(places: data, by: self.order)
            case .failure(let type):
                self.showErrorAlert(errorType: type)
            }
        }
    }
}
