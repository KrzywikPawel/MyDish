//
//  NeedProductsTableViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class NeedProductsTableViewCell: UITableViewCell {
       
    @IBOutlet weak private var quantityLabel: UILabel?
    @IBOutlet weak private var productNameLabel: UILabel?
    
    func configurateWithItem(quantity:String,name:String) {
        quantityLabel?.text = quantity
        quantityLabel?.textColor = .systemGray
        quantityLabel?.font = quantityLabel?.font.withSize(14)
        productNameLabel?.text = name
        productNameLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
}
