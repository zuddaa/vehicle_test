//
//  PostVehicleRequest.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public struct PostVehicleRequest: Codable {
  let vin: String
  let vehicleBodyTypeId: String?
  
  public init(vin: String, vehicleBodyTypeId: String?) {
    self.vin = vin
    self.vehicleBodyTypeId = vehicleBodyTypeId
  }
}
