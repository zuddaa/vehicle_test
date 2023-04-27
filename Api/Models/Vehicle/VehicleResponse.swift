//
//  VehicleResponse.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import ObjectMapper

public struct VehicleResponse: Codable {
  
  public let count: Int
  public let results: [Vehicle]
}
