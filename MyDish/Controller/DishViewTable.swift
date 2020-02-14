//
//  NeedsProductsTable.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit
extension DetailDishViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == setView.getIngredientsTable()){
            return productsArray.count
        }
        return directions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == setView.getIngredientsTable()){
            let height = tableView.contentSize.height
            setView.setHeightIngredientsTable(height)
            let cell = tableView.dequeueReusableCell(withIdentifier: "NeedProductsTableViewCell", for: indexPath) as! NeedProductsTableViewCell
            cell.configurateWithItem(quantity: quantityProducts[indexPath.row], name: productsArray[indexPath.row])
            return cell
        }
        let height = tableView.contentSize.height
               setView.setHeightDirectionTable(height)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DirectionsTableViewCell
        let stepNr = indexPath.row+1
        cell.configurateWithItem(step: stepNr, direction: directions[indexPath.row])
        return cell
    }
    
}
