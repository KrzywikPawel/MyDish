//
//  DirectionsTableViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 02/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class DirectionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nrStepsLbl: UILabel!
    @IBOutlet weak var directionLbl: UILabel!
    
    func configurateWithItem(step: Int,direction: String){
        nrStepsLbl.text = "step \(step)"
        nrStepsLbl.font = nrStepsLbl.font.withSize(13)
        nrStepsLbl.textColor = .systemGray
        directionLbl.text = direction
    }
}
