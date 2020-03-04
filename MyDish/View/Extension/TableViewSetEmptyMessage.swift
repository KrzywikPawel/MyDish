//
//  TableViewSetEmptyMessage.swift
//  MyDish
//
//  Created by Pawel Krzywik on 24/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit
extension UITableView{
    func setEmptyMessage(_ message: String) {
        let messageLbl = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
        messageLbl.text = message
        messageLbl.font = UIFont(name: "Avenir-Light", size: 18)
        messageLbl.textColor = .black
        messageLbl.sizeToFit()
        messageLbl.numberOfLines = 0
        messageLbl.textAlignment = .center
        self.backgroundView = messageLbl
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
