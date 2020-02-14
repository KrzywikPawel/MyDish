//
//  MainCollectionViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 11/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

protocol BtnAction: class {
    func cookLaterAction(_ sender: UIButton)
    func addToShopListAction(_ sender: UIButton)
}

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var dishImage: UIImageView?
    @IBOutlet weak private var nameLabel: UILabel?
    @IBOutlet weak private var timeLabel: UILabel?
    @IBOutlet weak private var buttonLvl1: UIButton?
    @IBOutlet weak private var buttonLvl2: UIButton?
    @IBOutlet weak private var buttonLvl3: UIButton?
    @IBOutlet weak  var cookLaterButton: UIButton?
    @IBOutlet weak  var addToShopListButton: UIButton?
    
    private let customize = CustomizeMainDescription()
    weak var delegate: BtnAction?
    
    func configurateWithItem(_ width: CGFloat,_ dishImgName: String,_ name:String,_ time: String,_ lvl:Int,_ id: Int){
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        dishImage?.image = UIImage(named: dishImgName)
        dishImage?.translatesAutoresizingMaskIntoConstraints = false
        dishImage?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dishImage?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nameLabel?.text = name
        var array = [buttonLvl1,buttonLvl2,buttonLvl3]
        array = customize.levelCustomization(lvl, array as! [UIButton])
        let min = "\(time) min"
        let attributedTime = customize.upperTime(min)
        timeLabel?.attributedText = attributedTime
        cookLaterButton?.tag = id
        addToShopListButton?.tag = id
    }
    
    @IBAction func cookLaterButton(_ sender: UIButton) {
        delegate?.cookLaterAction(sender)
    }
    
    @IBAction func addToShopListButton(_ sender: UIButton) {
        delegate?.addToShopListAction(sender)
    }
    
    
}

