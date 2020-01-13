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
    var categories: [Category] = [.all, .facility, .maintenance, .fire, .gas, .electronic, .elevator, .building]
    
    @IBAction func search(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let searchPlaceVC = mainStoryboard.viewController(SearchPlaceViewController.self)
        searchPlaceVC.keyword = searchTextField.text
        self.navigationController?.pushViewController(searchPlaceVC, animated: true)
    }
    
    @IBAction func addInfo(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = mainStoryboard.viewController(AddViewController.self)
        var categories = Category.allCases.map { (category) in
            return ExpandCellData(opened: false, category: category, safetyGrade: .unknown, desc: "")
        }
        categories.remove(at: 0)
        addVC.tableViewData = categories
        let navi = UINavigationController(rootViewController: addVC)
        navi.modalPresentationStyle = .fullScreen
        navi.navigationBar.tintColor = #colorLiteral(red: 0.3321701288, green: 0.3321786821, blue: 0.3321741223, alpha: 1)
        self.present(navi, animated: true)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setCollectionView()
        setupToHideKeyboardOnTapOnView()
        setTextField()
    }
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setTextField() {
        searchTextField.delegate = self
        searchTextField.returnKeyType = .done
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
        let placeListVC = mainStoryboard.viewController(PlaceListViewController.self)
        placeListVC.selectedCategory = categories[indexPath.row]
        placeListVC.categories = self.categories
        self.show(placeListVC, sender: nil)
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

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        search("")
        return true
    }
}
