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
import Api

class HomeViewModel {
  @LazyInjected
  var router: HomeRouter
  @LazyInjected
  private var vehicleRepo: VehicleRepository
  var disposeBag = DisposeBag()
  
  // Set the number of items to fetch per page
  let itemsPerPage = 10
  
  // Set the current page
  var currentPage = 0
  var loading = BehaviorRelay<Bool>(value: true)
  
  
  var vehicles = [Vehicle]()
  
  func fetchItems(){
    loading.accept(true)
    let results = vehicleRepo.fatchVehicles()
     results.subscribe {[weak self] result in
       switch result {
       case .success(let vehicleResponse):
         print(vehicleResponse)
         self?.vehicles = vehicleResponse.results
         self?.currentPage = 1
         self?.loading.accept(false)
       case .error(let error):
         self?.loading.accept(false)
         print(error.localizedDescription)
    }
     }.disposed(by: disposeBag)
  }
  
  func fatchNewItems(){
    currentPage += 1
  }
}
