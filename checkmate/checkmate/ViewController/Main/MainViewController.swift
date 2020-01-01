//
//  MainViewController.swift
//  checkmate
//
//  Created by 강수진 on 2020/01/01.
//  Copyright © 2020 강수진. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    var categories: [Category] = [.all, .lifeControl, .maintenance, .fire, .gas, .electronic, .elevator, .building]
    
    @IBAction func search(
        _ sender: Any) {
    }
    @IBAction func addInfo(_ sender: Any) {
    }
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationImage()
        setCollectionView()
    }
    func setNavigationImage() {
        let logo = #imageLiteral(resourceName: "logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

    }
    func setCollectionView() {
           collectionView.delegate = self
           collectionView.dataSource = self
       }
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cell(type: MainCollectionViewCell.self, for: indexPath)
        cell.configure(data: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let buildingListVC = mainStoryboard.viewController(BuildingListViewController.self)
        buildingListVC.selectedCategory = categories[indexPath.row]
        self.show(buildingListVC, sender: nil)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    //section내의
    //-간격 위아래
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //-간격 왼쪽오른쪽
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width/2 - 10
        return CGSize(width: width, height: width*0.76)
    }
    //collectionView inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 36, left: 6, bottom: 36, right: 6)
    }
}