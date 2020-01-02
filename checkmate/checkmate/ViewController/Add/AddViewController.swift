//
//  AddViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/02.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

struct ExpandCellData {
    var opened: Bool
    var category: Category
    var safetyGrade: SafetyGrade
    var desc: String
}

class AddViewController: UIViewController, NibLoadable {
    var tableViewData = [ExpandCellData]()
    var selectedPlace: PlaceDetail?
    var selectedCategory: Category?
    
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var legalTownNameTextField: UITextField!
    @IBOutlet var realNumTextField: UITextField!
    @IBOutlet var pkNumTextField: UITextField!
    @IBOutlet var useCategoryTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setupUI()
        setupTableView()
        setNavigationBarImage()
    }
    
    func setNavigationBarImage() {
        let logo = #imageLiteral(resourceName: "logo")
        let imageView = UIImageView(image:logo)
        navigationBar.topItem?.titleView = imageView
    }
    
    func registerTableViewCells() {
        tableView.register(UINib(nibName: "AddExpandedCell", bundle: nil), forCellReuseIdentifier: AddExpandedCell.nibId)
        tableView.register(UINib(nibName: "ExpandableCell2", bundle: nil), forCellReuseIdentifier: ExpandableCell2.nibId)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerTableViewCells()
    }
    
    func setData() {
        guard let selectedPlace = selectedPlace else {
            return
        }
        tableViewData = selectedPlace.detailInfo.map({ (detailInfo) in
            var cellData = ExpandCellData(opened: false,
                                          category: detailInfo.categoryIdx,
                                          safetyGrade: detailInfo.grade,
                                          desc: detailInfo.detail)
            cellData.opened = detailInfo.categoryIdx == selectedCategory
            return cellData
        })
    }
    
    func setupUI() {
        guard let selectedPlace = selectedPlace else {
            return
        }
        nameTextField.text = selectedPlace.name
        legalTownNameTextField.text = selectedPlace.legalName
        realNumTextField.text = selectedPlace.num
        useCategoryTextField.text = Category(rawValue: selectedPlace.useIdx)?.name
        pkNumTextField.text = selectedPlace.pk
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        print("이름: \(nameTextField.text)")
        //todo child에 있는 내용물들 뽑아내기
        for (sectionIndex, _) in tableViewData.enumerated() {
            let sectionData = tableViewData[sectionIndex]
            print(sectionData.desc)
            print(sectionData.category.name)
            print(sectionData.safetyGrade.rawVal)
        }
    }
}

extension AddViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened {
            // tableViewData[section].sectionData.count + 1
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
            cell.moreLabel.text = "추가하기"
            return cell
        } else {
            let cell = tableView.cell(for: AddExpandedCell.self)
            cell.configure(sectionIndex: indexPath.section,
                           safetyGrade: tableViewData[indexPath.section].safetyGrade,
                           data: tableViewData[indexPath.section])
            cell.addExpandedCellDelegate = self
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
                UIView.animate(withDuration: 0.3) {
                    cell?.customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0.0, 0.0, 0.0)
                }
            } else {
                //열기
                UIView.animate(withDuration: 0.3) {
                    cell?.customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 1.0, 0.0, 0.0)
                }
            }
        }
    }
}

extension AddViewController: AddExpandedCellDelegate {
    func writeDescription(sectionIndex:Int, desc: String) {
        self.tableViewData[sectionIndex].desc = desc
    }
    
    func clickSafteyButton(sectionIndex:Int, grade: SafetyGrade) {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: sectionIndex)) as? ExpandableCell2 {
            self.tableViewData[sectionIndex].safetyGrade = grade
            cell.changeCircleColor(selectedGrade: grade)
        }
    }
}