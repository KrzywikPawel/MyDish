//
//  TakePropertiesData.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
class TakePropertiesData {
    
    
    private func takeDishProperties() -> Array<DishPropertiesStruct> {
        var arrayProperties: Array<DishPropertiesStruct> = []
        do{
            let url = Bundle.main.url(forResource: "PropertiesDish", withExtension: "json")
            let data = try Data(contentsOf: url!)
            arrayProperties = try JSONDecoder().decode([DishPropertiesStruct].self, from: data)
        }catch{
            print("error parse properties data")
        }
        return arrayProperties
    }
    
    func takeProperties(id:Int) -> DishPropertiesStruct {
        var properties: DishPropertiesStruct = DishPropertiesStruct(id: 0, products: [],quantity: [], steps: [])
        let arrayProperties = takeDishProperties()
        for item in arrayProperties{
            if(item.id == id){
                properties = item
            }
        }
        return properties
    }
}
