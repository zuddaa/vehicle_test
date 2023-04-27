//
//  VehiclesRepository.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import RxSwift

public protocol VehicleRepository {
   func fatchVehicles() -> Observable<ApiResult<VehicleResponse>>
   func postVehicle(vehicleRequest: PostVehicleRequest) -> Observable<ApiResult<PostVehicleResponse>>
}
