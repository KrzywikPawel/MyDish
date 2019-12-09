//
//  DishPropertiesStruct.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
struct DishPropertiesStruct:Decodable {
    let id: Int
    let img: Array<String>
    let products:Array<String>
    let steps: Array<String>
}
