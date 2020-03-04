//
//  ConfirmShopTableView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 04/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

extension ConfirmShopListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmShopListTableViewCell", for: indexPath) as! ConfirmShopListTableViewCell
        let width = tableView.bounds.width
        let tag = indexPath.row
        cell.configurateWithItem(quantityProduct[indexPath.row],products[indexPath.row], width, tag)
        return cell
    }
    
    @objc func check(_ sender: UIButton) {
        let id = sender.tag
        if sender.isSelected{
            sender.isSelected = false
            arraySavedQuantity.append(quantityProduct[id])
            arraySavedProducts.append(products[id])
        } else {
            sender.isSelected = true
            //if removable index whose is after another before deleted, array change indexes (without hole) conditions find correct index
            if let i = arraySavedProducts.firstIndex(where: {$0 == products[id]}){
                arraySavedProducts.remove(at: i)
                arraySavedQuantity.remove(at: i)
            }
        }
    }
}
