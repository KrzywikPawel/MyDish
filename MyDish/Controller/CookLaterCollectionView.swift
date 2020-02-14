//
//  CookLaterCollectionView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit
extension CookLaterViewController:UICollectionViewDataSource,UICollectionViewDelegate, BtnAction{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dishesInArray.count == 0{
            let setMessage = SetEmptyTableAndCollectionMessage()
            setMessage.collectionSetEmptyMessage(collectionView,emptyMessage)
        }else{
//            method in CollectionViewSetEmptyMessage file
            collectionView.restore()
        }
        return dishesInArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        dish = TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row])
        cell.delegate = self
        cell.cookLaterButton?.setImage(UIImage(named: "delete"), for: .normal)
        let width = collectionView.contentSize.width
        cell.configurateWithItem(width,dish.image, dish.name, dish.time, dish.level,dish.id)
        return cell
    }
    
    func addToShopListAction(_ sender: UIButton){
        let dish = TakePropertiesData().takeProperties(id: sender.tag)
        let dishStruct = TakeDataToMainView().takeDishFromId(id: dish.id)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pushConfirmShopListVC = storyboard.instantiateViewController(identifier: "ConfirmShopListViewController") as! ConfirmShopListViewController
        pushConfirmShopListVC.products = dish.products
        pushConfirmShopListVC.quantityProduct = dish.quantity
        pushConfirmShopListVC.id = dish.id
        pushConfirmShopListVC.name = dishStruct.name
        self.navigationController?.pushViewController(pushConfirmShopListVC, animated: true)
    }
//    delete dish from list
    func cookLaterAction(_ sender: UIButton){
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
        let push = mainStoryboard.instantiateViewController(withIdentifier: "DishProductViewController") as! DetailDishViewController
        dish = TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row])
        push.name = dish.name
        push.id = dish.id
        push.imgName = dish.image
        self.navigationController?.pushViewController(push, animated: true)
    }
}


