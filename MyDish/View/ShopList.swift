//
//  ShopList.swift
//  MyDish
//
//  Created by Pawel Krzywik on 24/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

class ShopList: UIView {
    @IBOutlet weak var shopListTable: UITableView!
    
    override func awakeFromNib() {
        setShopListTable()
    }
    
   private func setShopListTable() {
        shopListTable.tableFooterView = UIView()
        shopListTable.backgroundColor = .systemGray6
    }
    
}
