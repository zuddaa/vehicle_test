//
//  VehicleDataRepository.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import RxSwift
import Resolver

public class VehicleDataRepository: VehicleRepository {
  
  @LazyInjected
  private var remoteDataSource: VehicleRemoteDataSource
  @LazyInjected
  private var localDataSource: VehicleLocalDataSource
  
  public func fatchVehicles() -> Observable<ApiResult<VehicleResponse>> {
    return remoteDataSource.getVehicles()
  }
  
  public func postVehicle(vehicleRequest: PostVehicleRequest) -> Observable<ApiResult<PostVehicleResponse>> {
    remoteDataSource.postVehicle(vehicleRequest: vehicleRequest)
  }
  public init(){}
}
