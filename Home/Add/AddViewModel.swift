//
//  AddViewModel.swift
//  Home
//
//  Created by Izudin Vragic on 27. 4. 2023..
//

import Foundation
import Api
import Resolver
import RxSwift
import RxCocoa

class AddViewModel {
 
  @LazyInjected
  var router: HomeRouter
  @LazyInjected
  private var vehicleRepo: VehicleRepository
  var response = BehaviorRelay<PostVehicleResponse?>(value: nil)
  var error = BehaviorRelay<DomainError?>(value: nil)
  var disposeBag = DisposeBag()
  
  
  
  func add(vin: String, vehicleBodyTypeId: String){
    vehicleRepo.postVehicle(vehicleRequest: PostVehicleRequest(vin: vin, vehicleBodyTypeId: nil)).subscribe {[weak self] response in
      switch response {
      case .success(let postResponse):
        self?.response.accept(postResponse)
      case .error(let error):
        self?.error.accept(error)
      }
    } onError: { error in
      print(error)
    }.disposed(by: disposeBag)
  }
}
