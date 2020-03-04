//
//  ShopListDataStruct.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
class ShopListDataStruct:Codable {
    var id = 0
    var name = ""
    var products = [String]()
    var quantity = [String]()
    
    init(_ id: Int,_ name: String,_ products: [String],_ quantity: [String]){
        self.id = id
        self.name = name
        self.products = products
        self.quantity = quantity
    }
    
    init() {}
}
