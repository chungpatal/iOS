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
        addVC.modalPresentationStyle = .fullScreen
        addVC.selectedCategory = selectedCategory
        addVC.selectedPlace = selectedPlace
        self.present(addVC, animated: true)
    }
    @IBAction func map(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        setupFirstData() //todo 지우기
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
        useCategoryLabel.text = Category(rawValue: selectedPlace.useIdx)?.name
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
    
    func setupFirstData() {
        let sampleDetail =  [DetailInfo(categoryIdx: .building, grade: .safe, detail: "내용입니다"),
                             DetailInfo(categoryIdx: .electronic, grade: .danger, detail:
                                """
                                처분 기준 ; 건축사법 시행령 제29조의2 별표1 개별기준 9호 가
                                영업 정지 시작일 : 20041108
                                영업정지 종료일 : 20050107
                                처분일 : 20041103
                                """),
                             DetailInfo(categoryIdx: .elevator, grade: .danger, detail: "내용입니다"),
                             DetailInfo(categoryIdx: .facility, grade: .safe, detail: "내용입니다"),
                             DetailInfo(categoryIdx: .fire, grade: .warn, detail: "내용입니다"),
                             DetailInfo(categoryIdx: .gas, grade: .safe, detail:
                                """
                                처분 기준 ; 건축사법 시행령 제29조의2 별표1 개별기준 9호 가
                                영업 정지 시작일 : 20041108
                                영업정지 종료일 : 20050107
                                처분일 : 20041103
                                처분 기준 ; 건축사법 시행령 제29조의2 별표1 개별기준 9호 가
                                영업 정지 시작일 : 20041108
                                영업정지 종료일 : 20050107
                                처분일 : 20041103
                                """),
                             DetailInfo(categoryIdx: .maintenance, grade: .warn, detail: "내용입니다")]
        let sampleData = PlaceDetail(placeIdx: 0,
                                     name: "사랑의집",
                                     address: "합정",
                                     totalGrade: .safe,
                                     legalName: "공덕동",
                                     num: "0168/0000",
                                     useIdx: 1,
                                     pk: "140-00",
                                     detailInfo: sampleDetail)
        selectedPlace = sampleData
    }
    

}
