//
//  ShopListStructInCache.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
struct  ShopListStructInCache {
    static func save (_ value: [ShopListDataStruct]!) {
           UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: "shopList")
       }
    
     func delete( index: Int) {
        var shopList = ShopListStructInCache.get()
        shopList.remove(at: index)
        ShopListStructInCache.save(shopList)
    }
    
    static func get() -> [ShopListDataStruct] {
        var shopList: [ShopListDataStruct] = []
        do{
            let data = UserDefaults.standard.value(forKey: "shopList") ?? Data()
            shopList = try PropertyListDecoder().decode([ShopListDataStruct].self, from: data as! Data)
        } catch {
            print("error")
        }
        return shopList
    }
    
    static func clear() {
        UserDefaults.standard.removeObject(forKey: "shopList")        
    }
}

