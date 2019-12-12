//
//  CookLaterViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class CookLaterViewController: UIViewController {
    
    @IBOutlet weak var cookLaterCollectionview: UICollectionView!
    let vc:ViewController = ViewController()
    var dish = Dish(id: 0, image: "", name: "", time: "", level: -1)
    var dishesInArray: Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        cookLaterCollectionview.register(nibCell, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.dishesInArray = self.vc.defaults.array(forKey: "arrayCookLater") as? [Int] ?? [Int]()
        self.cookLaterCollectionview.reloadData()
    }
}
