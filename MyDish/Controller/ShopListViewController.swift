//
//  ShopListViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class ShopListViewController: UIViewController {
    
    @IBOutlet var setView: ShopList!
    
    var shopListStruct = [ShopListDataStruct]()
    var shopList = [[String]]()
    var headerName = [String]()
    var quantityProduct = [[String]]()
    let emptyMessage = "Pusto \nKliknij ikone koszyka w daniu \ni nie zapomnij o potrzebnych produktach"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(addTapped))
        let idHeader = "HeaderSectionView"
        let headerNIB = UINib(nibName: idHeader, bundle: Bundle.main)
        setView.shopListTable.register(headerNIB, forHeaderFooterViewReuseIdentifier: idHeader)
    }
    
    @objc private func addTapped() {
        ShopListStructInCache.clear()
        viewWillAppear(false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headerName = [String]()
        shopList = [[String]]()
        quantityProduct = [[String]]()
        shopListStruct = ShopListStructInCache.get()
        for item in shopListStruct{
            headerName.append(item.name)
            shopList.append(item.products)
            quantityProduct.append(item.quantity)
        }
        setView.shopListTable.reloadData()
    }
}
