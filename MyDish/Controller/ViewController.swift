//
//  ViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainDishCollection: UICollectionView!
    
    var arrayDish: [Dish] = {
        let data = TakeDataToMainView()
        var arrayDish = data.parseData()
        return arrayDish
    }()
    var operationInMemory = UserDefaults.standard
    var arrayLaterCookDishes:[Int] = []
    
    override func viewDidLoad() {
        arrayLaterCookDishes = operationInMemory.array(forKey: "arrayCookLater") as? [Int] ?? [Int]()
        let nibCell = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        mainDishCollection.register(nibCell, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
}


