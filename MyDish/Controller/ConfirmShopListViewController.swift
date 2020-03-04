//
//  ConfirmShopListViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 04/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class ConfirmShopListViewController: UIViewController {
    
    @IBOutlet var setView: ConfirmShopList!
    
    var quantityProduct = [String]()
    var products = [String]()
    var arraySavedQuantity = [String]()
    var arraySavedProducts = [String]()
    var name = String()
    var id = Int()
    var deletePosition = String()
    private let titleText =  "Review Ingredients"
    private let alertText = "Musisz zaznaczyc minimum jeden produkt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arraySavedProducts = products
        arraySavedQuantity = quantityProduct
        customizeNavigationBar()
    }
    
    private func customizeNavigationBar() {
        self.title = titleText
        let backBtn = UIButton(type: .custom)
        setView.backBtnLayout(backBtn)
        let leftItem = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItem = leftItem
        backBtn.addTarget(self, action: #selector(backToView(sender:)), for: .touchUpInside)
        
    }
    
    @objc private func backToView(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func confirm(_ sender: UIButton) {
        if arraySavedProducts.isEmpty{
            emptyArrayAlert()
        } else {
            let shopList = ShopListDataStruct()
            shopList.id = id
            shopList.name = name
            shopList.products = arraySavedProducts
            shopList.quantity = arraySavedQuantity
            var array = ShopListStructInCache.get()
            if array.contains(where: {$0.id == id}){
                // try add product list which already is added
            }else{
                array.append(shopList)
                ShopListStructInCache.save(array)
            }
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let shopListVc = storyboard.instantiateViewController(identifier: "ShopListViewController") as! ShopListViewController
            shopListVc.navigationItem.setHidesBackButton(true, animated: false)
            self.navigationController?.pushViewController(shopListVc, animated: true)
        }
    }
    
    private func emptyArrayAlert() {
        let alert = UIAlertController(title: "Lista Pusta", message: alertText, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler:{ _ in}))
        self.present(alert, animated: true, completion: nil)
    }
}
