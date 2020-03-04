//
//  DishStruct.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
struct Dish:Decodable {
    let id:Int
    let image: String
    let name: String
    let time: String
    let level: Int
}
