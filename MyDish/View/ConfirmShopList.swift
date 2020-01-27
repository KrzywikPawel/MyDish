//
//  ConfirmShopList.swift
//  MyDish
//
//  Created by Pawel Krzywik on 24/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

class ConfirmShopList: UIView{
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var confirmTable: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .systemGray6
        customizeConfirmBtn()
        customizeConfirmTable()
    }
    
    private func customizeConfirmBtn() {
        confirmBtn.setTitle("Confirm", for: .normal)
        confirmBtn.setTitleColor(UIColor.systemGreen, for: .normal)
        confirmBtn.backgroundColor = .black
        confirmBtn.layer.cornerRadius = 20
        confirmBtn.layer.borderWidth = 1
        let vc = ConfirmShopListViewController()
        confirmBtn.addTarget(vc, action: #selector(vc.confirm(_:)) , for: .touchUpInside)
    }
    
    func customizeBackBtn(_ backBtn: UIButton){
        backBtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        backBtn.setImage(UIImage(named: "back"), for: .normal)
    }
    
    private func customizeConfirmTable(){
        confirmTable.tableFooterView = UIView()
        confirmTable.backgroundColor = .systemGray6
    }
    
}
