//
//  SpecificDetailViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class SpecificDetailViewController: UIViewController, NibLoadable {

   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var safetyGradeView: UIImageView!
   @IBOutlet weak var safetyGradeLabel: UILabel!
   @IBOutlet weak var legalTownNameLabel: UILabel!
   @IBOutlet weak var realNumLabel: UILabel!
   @IBOutlet weak var useCategoryLabel: UILabel!
   @IBOutlet weak var pkNumLabel: UILabel!
   @IBOutlet weak var detailLabel: UITextView!
    var tableViewData = [ExpandCellData]()
    var selectedCategory: Category?
    var selectedPlaceIdx: Int?
    var selectedPlace: PlaceDetail? {
        didSet {
            if let selectedPlace = selectedPlace {
                self.setupUI(selectedPlace: selectedPlace)
            }
        }
    }
    
    @IBAction func editInfo(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = mainStoryboard.viewController(AddViewController.self)
        addVC.selectedCategory = selectedCategory
        addVC.selectedPlace = selectedPlace
        let navi = UINavigationController(rootViewController: addVC)
        navi.modalPresentationStyle = .fullScreen
        navi.navigationBar.tintColor = #colorLiteral(red: 0.3321701288, green: 0.3321786821, blue: 0.3321741223, alpha: 1)
        self.present(navi, animated: true)
    }
    
    @IBAction func map(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let lat = selectedPlace?.lat, let long = selectedPlace?.long else {
            self.showSimpleAlert(title: "해당 위치를 찾을 수 없습니다", message: "")
            return
        }
        let mapVC = mainStoryboard.viewController(MapViewController.self)
        mapVC.geo = (lat, long)
        self.show(mapVC, sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedPlaceIdx = selectedPlaceIdx  {
            getPlaceDetail(selectedPlaceIdx: selectedPlaceIdx)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        setupData()
    }
    
    func setupData() {
        guard let selectedPlace = selectedPlace else {
            return
        }
        tableViewData = selectedPlace.detailInfo.map({ (detailInfo) in
            return ExpandCellData(opened: false,
                                  category: detailInfo.categoryIdx,
                                  safetyGrade: detailInfo.grade,
                                  desc: detailInfo.detail)
        })
    }
    func setupUI(selectedPlace: PlaceDetail) {
        nameLabel.text = selectedPlace.name
        legalTownNameLabel.text = selectedPlace.legalName
        realNumLabel.text = selectedPlace.num
        useCategoryLabel.text = selectedPlace.useIdx.name
        pkNumLabel.text = selectedPlace.pk
        
        guard let selectedCategory = selectedCategory else {
            return
        }
        let selectedCategoryInfo = selectedPlace.detailInfo.filter { (detailInfo) in
            return detailInfo.categoryIdx == selectedCategory
        }.first
        
        safetyGradeView.image = selectedCategoryInfo?.grade.colorImage
        safetyGradeLabel.text = selectedCategoryInfo?.grade.name
        detailLabel.text = selectedCategoryInfo?.detail
    }
}

// MARK: Network
extension SpecificDetailViewController: AlertUsable {
    func getPlaceDetail(selectedPlaceIdx: Int) {
        NetworkManager.sharedInstance.getPlaceDetail(placeIdx: selectedPlaceIdx) { [weak self] (res) in
            guard let self = self else { return }
            switch res {
            case .success(let data):
                self.selectedPlace = data
            case .failure(let type):
                self.showErrorAlert(errorType: type)
            }
        }
    }
}
