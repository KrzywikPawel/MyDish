//
//  ConfirmShopListTableViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 04/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class ConfirmShopListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var quantityLbl: UILabel!
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var checkBtn: UIButton!
    
    func configurateWithItem(_ quantity: String,_ name: String, _ width: CGFloat, _ tag: Int) {
        setCell(width)
        setQuantityLbl(quantity)
        setNameLbl(name)
        checkBtnAction(tag)
    }
    
    private func setCell(_ width: CGFloat) {
        frame = CGRect(x: 0, y: 0, width: width, height: 100)
        layer.borderWidth = 5
        layer.borderColor = UIColor.systemGray6.cgColor
    }
    
    private func setNameLbl(_ name: String) {
        nameLbl.text = name
        nameLbl.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    private func setQuantityLbl(_ quantity: String) {
        quantityLbl.font = UIFont.boldSystemFont(ofSize: 17)
        quantityLbl.text = quantity
    }
    
    private func checkBtnAction(_ tag: Int) {
        checkBtn.tintColor = .systemGreen
        checkBtn.tag = tag
        let vc = ConfirmShopListViewController()
        checkBtn.addTarget(vc, action: #selector(vc.check(_:)), for: .touchUpInside)
    }
}
