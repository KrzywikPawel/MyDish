//
//  CookLaterCollectionView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit
extension CookLaterViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishesInArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        dish = TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row])
        cell.dishImage.image = UIImage(named: dish.image)
        cell.nameLabel.text = dish.name
        cell.cookLaterButton.setImage(UIImage(named: "delete"), for: .normal)
        let customizationAttribute = CustomizeMainDescription(dish: dish)
        let min = "\(dish.time) min"
        let lvl = dish.level
        customizationAttribute.customizeAttributedCell(indexPath,cell,min,lvl)
        cell.cookLaterButton.tag = dish.id
        cell.cookLaterButton.addTarget(self, action: #selector(self.deleteDishFromList(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc private func deleteDishFromList(sender:UIButton){
        let id = sender.tag
        for (index,value) in dishesInArray.enumerated(){
            if(value == id){
                dishesInArray.remove(at: index)
                break;
            }
        }
        var array = defaults.array(forKey: "arrayCookLater") as? [Int] ?? [Int]()
        for (index,value) in array.enumerated(){
            if(value == id){
                array.remove(at: index)
                break
            }
        }
        defaults.set(array, forKey: "arrayCookLater")
        cookLaterCollectionview.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let push = mainStoryboard.instantiateViewController(withIdentifier: "DishProductViewController") as! DishProductViewController
        dish = TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row])
        push.name = dish.name
        push.id = dish.id
        self.navigationController?.pushViewController(push, animated: true)
    }
}