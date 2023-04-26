//
//  HomeViewModel.swift
//  Home
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Resolver
import RxSwift
import RxCocoa

class HomeViewModel {
  @LazyInjected
  private var router: HomeRouter
  // Set the number of items to fetch per page
  let itemsPerPage = 10
  
  // Set the current page
  var currentPage = 0
  
  
  
  func fetchItems(){
    
  }
  
}
