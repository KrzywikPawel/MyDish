//
//  DetailDishView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 10/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class DetailDishView:UIView {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var directionView: UIView!
    @IBOutlet private weak var directionTable: UITableView!
    @IBOutlet private weak var ingredientsTable: UITableView!
    @IBOutlet private weak var shopListBtn: UIButton!
    @IBOutlet private weak var dishNameLbl: UILabel!
    @IBOutlet private weak var cookLaterBtn: UIButton!
    @IBOutlet private weak var ingredientsLbl: UILabel!
    @IBOutlet private weak var directionsLbl: UILabel!
    @IBOutlet private weak var timeLbl: UILabel!
    @IBOutlet private weak var cookingTimeLbl: UILabel!
    @IBOutlet private weak var timeView: UIView!
    @IBOutlet private weak var img: UIImageView!
    @IBOutlet weak var topView: UIView!
    
    private let detailVC = DetailDishViewController()
    @IBOutlet weak var ingredientsTableHeight: NSLayoutConstraint!
    @IBOutlet weak var directionTableHeight: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTimeViewLayout()
        setIngredientsLbl()
        setDirectionsLbl()
        deleteExtraEmptyCell()
        setCookingTimeLbl()
        scrollAutoLayout()
        containerAutoLayout()
        topViewAutoLayout()
        directionViewAutoLayout()
    }
    
    func setHeightIngredientsTable(_ height: CGFloat) {
        ingredientsTableHeight.constant = height
    }
    
    func setHeightDirectionTable(_ height: CGFloat) {
        directionTableHeight.constant = height + 50
    }
    
    private func scrollAutoLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    private func containerAutoLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    private func topViewAutoLayout() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        topView.widthAnchor.constraint(equalToConstant: 375).isActive = true
    }
    
    private func directionViewAutoLayout() {
        directionView.translatesAutoresizingMaskIntoConstraints = false
        directionView.topAnchor.constraint(equalTo: timeView.bottomAnchor,constant: 28).isActive = true
        directionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        directionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        directionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    func getIngredientsTable() -> UITableView {
        return ingredientsTable
    }
    
    func getShopListBtn() -> UIButton {
        return shopListBtn
    }
    
    func getCookLaterBtn() -> UIButton {
        return cookLaterBtn
    }
    
    func getDirectionsTable() -> UITableView {
        return directionTable
    }
    
    private func deleteExtraEmptyCell() {
        ingredientsTable.tableFooterView = UIView()
        directionTable.tableFooterView = UIView()
    }
    
    private func setTimeViewLayout() {
        timeView.translatesAutoresizingMaskIntoConstraints = false
        timeView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        timeView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        timeView.widthAnchor.constraint(equalToConstant: 203).isActive = true
        timeView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        timeView.layer.borderWidth = 1
        timeView.layer.borderColor = UIColor.systemGray.cgColor
        timeView.layer.cornerRadius = 10
    }
    
    func setNameLbl(_ name: String) {
        dishNameLbl.text = name
        dishNameLbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private func setIngredientsLbl() {
        ingredientsLbl.text = "Ingredients"
        ingredientsLbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private func setDirectionsLbl() {
        directionsLbl.text = "Directions"
        directionsLbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    func setTimeLbl(_ time: String) {
        let stringTime = "\(time) MIN"
        timeLbl.text = stringTime
        timeLbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    func setCookingTimeLbl() {
        cookingTimeLbl.font = cookingTimeLbl.font.withSize(15)
        cookingTimeLbl.textColor = .systemGray
    }
    
    func setImg(_ imgName: String) {
        img.image = UIImage(named: imgName)
        
        self.img.translatesAutoresizingMaskIntoConstraints = false
        self.img.topAnchor.constraint(equalTo: topView.topAnchor, constant: -68).isActive = true
        self.img.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        self.img.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
        self.img.heightAnchor.constraint(equalToConstant: 371).isActive = true
    }
    
    func setNavigation(_ navigationController: UINavigationController) {
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        //  left swipe gestures to back previous controller (after change leftbarimage gesture  doesnt work without this)
        navigationController.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    
    
    
    
    
    
}
