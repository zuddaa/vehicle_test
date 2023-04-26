//
//  HomeFeature.swift
//  Home
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import UIKit
import RxSwift
import RxCocoa
import Resolver

public struct HomeFeature {
  
  public static func create(router: HomeRouter) -> UIViewController {
    return HomeViewController()
  }
}
