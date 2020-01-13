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

    var selectedPlaceIdx: Int?
    var selectedPlace: PlaceDetail? {
        didSet {
            if let selectedPlace = selectedPlace {
                self.setupUI(selectedPlace: selectedPlace)
                self.setupTableViewData(selectedPlace: selectedPlace)
            }
        }
    }
    var tableViewData = [ExpandCellData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedPlaceIdx = selectedPlaceIdx  {
            getPlaceDetail(selectedPlaceIdx: selectedPlaceIdx)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupInitialTableViewData()
        self.setNavigation()
    }
    
    func setupUI(selectedPlace: PlaceDetail) {
        nameLabel.text = selectedPlace.name ?? "(이름 없음)"
        safetyGradeView.image = selectedPlace.totalGrade.colorImage
        safetyGradeLabel.text = selectedPlace.totalGrade.name
        legalTownNameLabel.text = selectedPlace.legalName
        realNumLabel.text = selectedPlace.num
        useCategoryLabel.text = selectedPlace.useIdx.name
        pkNumLabel.text = selectedPlace.pk
    }
    
    func setupInitialTableViewData() {
        var categories = Category.allCases.map { (category) in
            return ExpandCellData(opened: false, category: category, safetyGrade: .unknown, desc: "데이터 없음")
        }
        categories.removeFirst() //all 삭제
        tableViewData = categories
    }
    
    func setupTableViewData(selectedPlace: PlaceDetail) {
        //todo only in specific 체크해서 지울수 있으면 지우기
        /*
        case facility = 1 //시설물
        case maintenance = 2 //유지관리
        case fire = 3//소방
        case gas = 4//가스
        case electronic = 5//전기
        case elevator = 6//승강기
        case building = 7//건축물
         */
        selectedPlace.detailInfo.forEach { (detailInfo) in
            let expectedRow = detailInfo.categoryIdx.rawValue-1
            tableViewData[expectedRow].safetyGrade = detailInfo.grade
            tableViewData[expectedRow].desc = detailInfo.detail
        }
    }
    
    @IBAction func editInfo(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = mainStoryboard.viewController(AddViewController.self)
        addVC.selectedPlace = selectedPlace
        addVC.tableViewData = tableViewData.map { (cellData) -> ExpandCellData in
            var cellData_ = cellData
            cellData_.opened = false
            return cellData_
        }
        let navi = UINavigationController(rootViewController: addVC)
        navi.modalPresentationStyle = .fullScreen
        navi.navigationBar.tintColor = #colorLiteral(red: 0.3321701288, green: 0.3321786821, blue: 0.3321741223, alpha: 1)
        self.present(navi, animated: true)
    }
    @IBAction func map(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let lat = selectedPlace?.lat, let long = selectedPlace?.long else {
            self.showSimpleAlert(title: "등록된 주소 정보가 없습니다", message: "")
            return
        }
        let mapVC = mainStoryboard.viewController(MapViewController.self)
        mapVC.geo = (lat, long)
        self.show(mapVC, sender: nil)
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

// MARK: Network
extension AllDetailViewController: AlertUsable {
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
