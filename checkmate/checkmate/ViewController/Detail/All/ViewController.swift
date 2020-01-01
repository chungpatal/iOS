//
//  ViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/01.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit
import ExpandableCell

struct SampleTable {
    let type: Category
    let safetyGrade : SafetyGrade
}

class ViewController: UIViewController {
    @IBOutlet var tableView: ExpandableTableView!
    let gas = SampleTable(type: .gas, safetyGrade: .warn)
    let fire = SampleTable(type: .fire, safetyGrade: .danger)
    var parentCells : [SampleTable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentCells = [gas, fire]
        
        tableView.expandableDelegate = self
        tableView.animation = .automatic
        
        registerTableViewCells()
    }
    
    func registerTableViewCells() {
        tableView.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: ExpandedCell.ID)
        tableView.register(UINib(nibName: "ExpandableCell2", bundle: nil), forCellReuseIdentifier: ExpandableCell2.ID)
    }
}

extension ViewController: ExpandableDelegate {
    func numberOfSections(in tableView: ExpandableTableView) -> Int {
          return 1
      }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        //parent cell 개수
        return parentCells.count
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //parent cell 높이
        return 44
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //parentCell 내용
        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) as? ExpandableCell2 else { return
            UITableViewCell() }
        cell.titleLabel.text = parentCells[indexPath.row].type.name
        cell.saftyGradeImageView.image = parentCells[indexPath.row].safetyGrade.colorImage
        cell.arrowImageView.isHidden = true
        return cell
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        //child cell 내용
        switch parentCells[indexPath.row].type {
        case .gas:
            let cell = tableView.cell(for: ExpandedCell.self)
            cell.titleLabel.text = "gas"
            return [cell]
        case .fire:
            let cell = tableView.cell(for: ExpandedCell.self)
            cell.titleLabel.text = "fire"
            return [cell]
        default:
            let cell = tableView.cell(for: ExpandedCell.self)
            cell.titleLabel.text = "기본 차일드"
            return [cell]
        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        //child cell height
        //todo 카테고리에 맞게 적절히 때려박기...?
        switch parentCells[indexPath.row].type {
        case .gas:
            return [100]
        case .fire:
            return [100]
        default:
            return [140]
        }
    }

    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        //parent cell 클릭
        guard let cell = expandableTableView.cellForRow(at: indexPath) as? ExpandableCell2 else { return }
        if cell.highlightAnimation == .animated {
            if cell.isExpanded() {
                //닫기
                cell.moreLabel.text = "더보기"
                UIView.animate(withDuration: 0.3) {
                    cell.customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0.0, 0.0, 0.0)
                }
            } else {
                //펼치기
                cell.moreLabel.text = "접기"
                UIView.animate(withDuration: 0.3) {
                    cell.customArrowImage.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 1.0, 0.0, 0.0)
                }
            }
        }
        print("didSelectRow:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath) {
        //child cell 클릭
        print("didSelectExpandedRowAt:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        if let cell = expandedCell as? ExpandedCell {
            print("\(cell.titleLabel.text ?? "")")
        }
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 
}


