//
//  try.swift
//  MyDish
//
//  Created by Pawel Krzywik on 25/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit
extension ShopListViewController: deleteBtnAction {
    
     func deleteAction(at indexPath:IndexPath,tableView: UITableView) -> UIContextualAction {
        var sectionWithDeleteProduct = self.shopList[indexPath.section]
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action,view,completion) in
            sectionWithDeleteProduct.remove(at: indexPath.row)
            self.shopList[indexPath.section] = sectionWithDeleteProduct
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if(sectionWithDeleteProduct.count == 0) {
                self.shopList.remove(at: indexPath.section)
                self.headerName.remove(at: indexPath.section)
                let indexSet = IndexSet(arrayLiteral: indexPath.section)
                tableView.deleteSections(indexSet, with: .automatic)
                self.shopListStruct.remove(at: indexPath.section)
                ShopListStructInCache.save(self.shopListStruct)
            }else{
                self.shopListStruct[indexPath.section].products = sectionWithDeleteProduct
                ShopListStructInCache.save(self.shopListStruct)
            }
        }
        action.image = UIImage(named: "delete")
        action.backgroundColor = .red
        self.shopListStruct[indexPath.section].products = sectionWithDeleteProduct
        ShopListStructInCache.save(shopListStruct)
        return action
    }

      func deleteBtnAction(_ sender: UIButton) {
         let sectionId = sender.tag
         headerName.remove(at: sectionId)
         shopList.remove(at: sectionId)
         let shopListStruct = ShopListStructInCache()
         shopListStruct.delete(index: sectionId)
        setView.shopListTable.reloadData()
     }
}
