//
//  SetEmptyTableAndCollectionMessage.swift
//  MyDish
//
//  Created by Pawel Krzywik on 24/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

class SetEmptyTableAndCollectionMessage {
    
    func collectionSetEmptyMessage(_ collectionView: UICollectionView, _ message: String) {
        collectionView.setEmptyMessage(message)
    }
    
    func tableSetEmptyMessage(_ tableView: UITableView, _ message: String) { 
        tableView.setEmptyMessage(message)
    }
    
}

