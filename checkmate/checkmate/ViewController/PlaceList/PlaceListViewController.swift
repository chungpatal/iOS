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
            sortPlaces()
        }
    }
    var selectedCategoryRow: Int = 0
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
        setCollectionViewLayout()
        setCollectionView()
        setTableView()
        selectInitialCategory()
        setNavigation()
        places = corePlace //todo delete
        isOrderHigh = true
    }
    
    func sortPlaces() {
        //sort
        if selectedCategory == .all {
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
        } else {
            if isOrderHigh {
                places.sort {
                    let categoryGrade1 = $0.detailInfo.filter { (detailInfo) in
                        return detailInfo.categoryIdx == selectedCategory
                    }.first?.grade
                    let categoryGrade2 = $1.detailInfo.filter { (detailInfo) in
                        return detailInfo.categoryIdx == selectedCategory
                    }.first?.grade
                    if categoryGrade1 == .unknown {
                        return false
                    }
                    return categoryGrade1?.rawVal ?? 0 < categoryGrade2?.rawVal ?? 0
                }
            } else {
                places.sort {
                    let categoryGrade1 = $0.detailInfo.filter { (detailInfo) in
                        return detailInfo.categoryIdx == selectedCategory
                    }.first?.grade
                    let categoryGrade2 = $1.detailInfo.filter { (detailInfo) in
                        return detailInfo.categoryIdx == selectedCategory
                    }.first?.grade
                    if categoryGrade1 == .unknown {
                        return false
                    }
                    return categoryGrade1?.rawVal ?? 0 > categoryGrade2?.rawVal ?? 0
                }
            }
        }
    }
    
    func selectInitialCategory() {
        self.collectionView.selectItem(at: IndexPath(item: selectedCategory?.rawVal ?? 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
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

extension PlaceListViewController: CategoryLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        widthForCategoryAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat(((categories[indexPath.item].name.count)*14)+24)
    }
}

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
        if selectedCategory == .all {
            let allDetailVC = mainStoryboard.viewController(AllDetailViewController.self)
            allDetailVC.selectedPlace = places[indexPath.row]
            self.show(allDetailVC, sender: nil)
        } else {
            let specificDetailVC = mainStoryboard.viewController(SpecificDetailViewController.self)
            specificDetailVC.selectedCategory = selectedCategory
            specificDetailVC.selectedPlace = places[indexPath.row]
            self.show(specificDetailVC, sender: nil)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
