//
//  HomeRouting.swift
//  Vehicle-Test
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import UIKit
import Home

class HomeRouting: HomeRouter {
  
  weak var navigation: UINavigationController?
  
  func addNewVehicle() {
    
  }
  
  init(navigation: UINavigationController) {
//    let buttonWidth = CGFloat(60)
//    let buttonHeight = CGFloat(60)
//
//    let button = UIButton(type: .custom)
//    button.setImage(UIImage(named: "home"), for: .normal)
//    button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//    button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
//    button.backgroundColor = .red
//
//    navigation.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: button)
    self.navigation = navigation
  }
}
