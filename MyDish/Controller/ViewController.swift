//
//  ViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    //MARK: dodawanie czasu musi byc 2cyfrowe, naprawic, format label time powoduja blad, podnoszenie zaczyna sie od 3 znaku, to przez to
    
    @IBOutlet weak var mainDishCollection: UICollectionView!
    
        var arrayDish: [Dish] = {
        let data = TakeDataToMainView()
        var arrayDish = data.parseData()
        return arrayDish
    }()
    var defaults = UserDefaults.standard
    var arrayLaterCookDishes:[Int] = []
    override func viewDidLoad() {
//          defaults.removeObject(forKey: "arrayCookLater")
        arrayLaterCookDishes = defaults.array(forKey: "arrayCookLater") as? [Int] ?? [Int]()
        let nibCell = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        mainDishCollection.register(nibCell, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
}


