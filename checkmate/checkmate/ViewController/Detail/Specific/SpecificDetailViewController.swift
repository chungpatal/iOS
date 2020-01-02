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
    var selectedPlace: PlaceDetail?
    
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        setupUI()
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
    
    func setupUI() {
        guard let selectedPlace = selectedPlace else {
            return
        }
        nameLabel.text = selectedPlace.name
        legalTownNameLabel.text = selectedPlace.legalName
        realNumLabel.text = selectedPlace.num
        useCategoryLabel.text = PlaceUsage(rawValue: selectedPlace.useIdx)?.name
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
