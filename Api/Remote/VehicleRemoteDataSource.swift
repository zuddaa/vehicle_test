//
//  VehicleRemoteDataSource.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Resolver
import RxSwift

public class VehicleRemoteDataSource {
  
  @LazyInjected
  private var service: VehiclesNetworkService
  
  func getVehicles()->Observable<ApiResult<VehicleResponse>>{
    service.getVehicles()
  }
  
  func postVehicle(vehicleRequest: PostVehicleRequest)->Observable<ApiResult<PostVehicleResponse>>{
    return service.postVehicle(vehicleRequest: vehicleRequest)
  }
  public init(){}
}
