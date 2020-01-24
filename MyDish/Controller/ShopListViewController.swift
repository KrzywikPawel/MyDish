//
//  ShopListViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class ShopListViewController: UIViewController {
    var shopListStruct = [ShopListDataStruct]()
    var shopList = [[String]]()
    var headerName = [String]()
    var quantityProduct = [[String]]()
    @IBOutlet weak var productsTableView: UITableView!
    let emptyMessage = "Pusto \nKliknij ikone koszyka w daniu \ni nie zapomnij o potrzebnych produktach"
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(addTapped))
        let idHeader = "HeaderSectionView"
        let headerNIB = UINib(nibName: idHeader, bundle: Bundle.main)
        productsTableView.register(headerNIB, forHeaderFooterViewReuseIdentifier: idHeader)
        productsTableView.tableFooterView = UIView()
        productsTableView.backgroundColor = .systemGray6
        
    }
    
    @objc private func addTapped()  {
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
        productsTableView.reloadData()
    }
}
