//
//  DishProductViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 02/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit
//MARK: refactor this view? (use container view)
class DetailDishViewController: UIViewController {
    @IBOutlet var setView: DetailDishView!
    
    var time: String = ""
    var name:String = ""
    var imgName: String = ""
    var id: Int = 0
    
    var directions = [String]()
    var productsArray = [String]()
    var quantityProducts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takeDishProperties()
        viewSet()
        leftBarBtnItem()   
    }
    
    private func viewSet() {
        setView.setNavigation(self.navigationController!)
        setView.setNameLbl(name)
        setView.setTimeLbl(time)
        setView.setImg(imgName)
        setView.getCookLaterBtn().addTarget(self, action: #selector(cookLater), for: .touchUpInside)
        setView.getShopListBtn().addTarget(self, action: #selector(addToShopList), for: .touchUpInside)
    }
    
    private func takeDishProperties() {
        let takeProperties = TakePropertiesData()
        let properties = takeProperties.takeProperties(id: id)
        productsArray = properties.products
        quantityProducts = properties.quantity
        directions = properties.steps
    }
    
    //     refactor to view?
    private func leftBarBtnItem() {
        let backbtn = UIButton(type: .custom)
        backbtn.setImage(UIImage(named: "back"), for: .normal)
        backbtn.addTarget(self, action: #selector(backToMainCollection(sender:)), for: .touchUpInside)
        backbtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let leftItem = UIBarButtonItem(customView: backbtn)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc private func backToMainCollection(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func cookLater() {
        let key = "arrayCookLater"
        let operationInMemory = UserDefaults.standard
        var arrayLaterCookDishes = operationInMemory.array(forKey: key)  as? [Int] ?? [Int]()
        if arrayLaterCookDishes.contains(id){
        }else{
            arrayLaterCookDishes.append(id)
        }
        operationInMemory.set(arrayLaterCookDishes, forKey: key)
    }
    
    @objc private func addToShopList() {
        let dish = TakePropertiesData().takeProperties(id: id)
        let dishStruct = TakeDataToMainView().takeDishFromId(id: dish.id)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pushConfirmShopListVC = storyboard.instantiateViewController(identifier: "ConfirmShopListViewController") as! ConfirmShopListViewController
        pushConfirmShopListVC.products = dish.products
        pushConfirmShopListVC.quantityProduct = dish.quantity
        pushConfirmShopListVC.id = dish.id
        pushConfirmShopListVC.name = dishStruct.name
        self.navigationController?.pushViewController(pushConfirmShopListVC, animated: true)
    }
    
}
