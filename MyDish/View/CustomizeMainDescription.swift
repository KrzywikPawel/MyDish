//
//  CustomizeMainDescription.swift
//  MyDish
//
//  Created by Pawel Krzywik on 01/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

class CustomizeMainDescription {
    private var arrayDish: [Dish] = []
    init() {
    }
    
    private let circleFill = UIImage(systemName: "circle.fill")
    private let circle = UIImage(systemName: "circle")
    
    private func setColourLvlCircle(_ array: [UIButton]) -> [UIButton] {
        array[0].tintColor = .systemGreen
        array[1].tintColor = .orange
        array[2].tintColor = .red
        return array
    }
    
    func levelCustomization(_ lvl:Int,_ cellBtnArray: [UIButton]) -> [UIButton] {
        var customizeBtnArray = [UIButton]()
        switch lvl {
        case 1:
            customizeBtnArray = setColourLvlCircle(cellBtnArray)
            customizeBtnArray[0].setImage(circleFill, for: .normal)
            customizeBtnArray[1].setImage(circle, for: .normal)
            customizeBtnArray[2].setImage(circle, for: .normal)
        case 2:
            customizeBtnArray = setColourLvlCircle(cellBtnArray)
            customizeBtnArray[0].setImage(circleFill, for: .normal)
            customizeBtnArray[1].setImage(circleFill, for: .normal)
            customizeBtnArray[2].setImage(circle, for: .normal)
        case 3:
            customizeBtnArray = setColourLvlCircle(cellBtnArray)
            customizeBtnArray[0].setImage(circleFill, for: .normal)
            customizeBtnArray[1].setImage(circleFill, for: .normal)
            customizeBtnArray[2].setImage(circleFill, for: .normal)
        default:
            print("nil")
        }
        return customizeBtnArray
    }
    
    func upperTime(_ min: String) -> NSMutableAttributedString {
        let nr  = min.indexOf(char: "m")
        let attributedString = NSMutableAttributedString(string: min)
        let range = NSRange(location: nr!, length: 3)
        attributedString.setAttributes([NSAttributedString.Key.baselineOffset: 8], range: range)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: range)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: NSRange(location: 0, length: nr!-1))
        return attributedString
    }
}
//find index char ("m") in string
fileprivate extension String {
    func indexOf(char: Character) -> Int? {
        return firstIndex(of: char)?.utf16Offset(in: self)
    }
}
