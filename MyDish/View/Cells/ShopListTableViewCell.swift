//
//  ShopListTableViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var quantityLbl: UILabel?
    @IBOutlet weak private var productLbl: UILabel?
    
    func configurateWithItem(_ quantity: String,_ product: String, _ width: CGFloat) {
        setCellLayout(width)
        quantityLbl?.text = quantity
        quantityLbl?.font = quantityLbl?.font.withSize(14)
        quantityLbl?.textColor = .systemGray
        productLbl?.text = product
        productLbl?.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    private func setCellLayout(_ width: CGFloat) {
        layer.frame = CGRect(x: 0, y: 0, width: width, height: 90)
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = 5
    }
}
