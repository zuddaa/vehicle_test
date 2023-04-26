//
//  MainCoordinator.swift
//  Vehicle-Test
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import UIKit
import Home

final class MainCoordinator: BaseCoordinator {
  
  public init(router: Router?) {
    super.init()
    self.router = router
  }
  
  deinit {
    print(#function, #line, #filePath)
  }
  
  override func start() {
   
  }
  
  func showHome() {
    let nav = UINavigationController()
    let vc = HomeFeature.create(router: HomeRouting(navigation: nav))
    nav.viewControllers = [vc]
    self.router?.setRootModule(vc)
  }
}
