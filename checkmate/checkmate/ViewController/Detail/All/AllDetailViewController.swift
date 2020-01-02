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
        self.setupTableView()
        self.setNavigation()
        self.setupUI()
        self.setupData()
    }
    
    //todo 지우기 - 엄청야매
    override func viewDidDisappear(_ animated: Bool) {
        selectedPlace?.detailInfo[Category.gas.rawVal-1].grade = .warn
        selectedPlace?.detailInfo[Category.gas.rawVal-1].detail =
        """
        최종 검사일: 20200103
        검사일: 20200103
        검사 결과명: 조건부합격
        """
        setupData()
        tableView.reloadData()
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
        useCategoryLabel.text = PlaceUsage(rawValue: selectedPlace.useIdx)?.name
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
    
    @IBAction func editInfo(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = mainStoryboard.viewController(AddViewController.self)
        addVC.selectedPlace = selectedPlace
        let navi = UINavigationController(rootViewController: addVC)
        navi.modalPresentationStyle = .fullScreen
        navi.navigationBar.tintColor = #colorLiteral(red: 0.3321701288, green: 0.3321786821, blue: 0.3321741223, alpha: 1)
        self.present(navi, animated: true)
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
                    cell?.customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 1.0, 0.0, 0.0)
                }
            } else {
                //열기
                cell?.moreLabel.text = "더보기"
                UIView.animate(withDuration: 0.3) {
                    cell?.customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0.0, 0.0, 0.0)
                }
            }
        }
    }
}

