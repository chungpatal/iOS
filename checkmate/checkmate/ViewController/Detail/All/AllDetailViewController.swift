//
//  AllDetailViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class AllDetailViewController: UIViewController, NibLoadable {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var safetyGradeView: UIImageView!
    @IBOutlet weak var safetyGradeLabel: UILabel!
    @IBOutlet weak var legalTownNameLabel: UILabel!
    @IBOutlet weak var realNumLabel: UILabel!
    @IBOutlet weak var useCategoryLabel: UILabel!
    @IBOutlet weak var pkNumLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    var selectedPlace: PlaceDetail?
    var tableViewData = [ExpandCellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFirstData() //todo 지우기
        self.setupTableView()
        self.setNavigation()
        self.setupUI()
        self.setupData()
    }
    
    func setupUI() {
        guard let selectedPlace = selectedPlace else {
            return
        }
        nameLabel.text = selectedPlace.name
        safetyGradeView.image = selectedPlace.totalGrade.colorImage
        safetyGradeLabel.text = selectedPlace.totalGrade.name
        legalTownNameLabel.text = selectedPlace.legalName
        realNumLabel.text = selectedPlace.num
        useCategoryLabel.text = Category(rawValue: selectedPlace.useIdx)?.name
        pkNumLabel.text = selectedPlace.pk
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
                                     totalGrade: .danger,
                                     legalName: "공덕동",
                                     num: "0168/0000",
                                     useIdx: 1,
                                     pk: "140-00",
                                     detailInfo: sampleDetail)
        selectedPlace = sampleData
    }
    
    @IBAction func editInfo(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = mainStoryboard.viewController(AddViewController.self)
        addVC.modalPresentationStyle = .fullScreen
        addVC.selectedPlace = selectedPlace
        self.present(addVC, animated: true)
    }
    @IBAction func map(_ sender: Any) {
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerTableViewCells()
    }
    
    func registerTableViewCells() {
        tableView.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: ExpandedCell.nibId)
        tableView.register(UINib(nibName: "ExpandableCell2", bundle: nil), forCellReuseIdentifier: ExpandableCell2.nibId)
    }
}

extension AllDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened {
            //위에 섹션까지 포함되니까
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.cell(for: ExpandableCell2.self)
            cell.configure(data: tableViewData[indexPath.section])
            cell.moreLabel.text = "더보기"
            return cell
        } else {
            let cell = tableView.cell(for: ExpandedCell.self)
            cell.configure(data: tableViewData[indexPath.section])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //아래 셀 클릭할때 닫히지 않도록
        if indexPath.row == 0 {
            tableViewData[indexPath.section].opened = !tableViewData[indexPath.section].opened
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none) //play animation
            
            let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell2
            if tableViewData[indexPath.section].opened {
                //닫기
                cell?.moreLabel.text = "접기"
                UIView.animate(withDuration: 0.3) {
                    cell?.customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0.0, 0.0, 0.0)
                }
            } else {
                //열기
                cell?.moreLabel.text = "더보기"
                UIView.animate(withDuration: 0.3) {
                    cell?.customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 1.0, 0.0, 0.0)
                }
            }
        }
    }
}

