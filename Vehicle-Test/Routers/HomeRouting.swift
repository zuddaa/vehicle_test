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
    let vc = HomeFeature.createAddViewController()
    navigation?.pushViewController(vc, animated: true)
  }
  
  init(navigation: UINavigationController) {
    self.navigation = navigation
  }
}
