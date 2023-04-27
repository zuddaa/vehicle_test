//
//  VehiclesNetworkService.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import RxSwift
import RxAlamofire
import Resolver
import ObjectMapper

public class VehiclesNetworkService {
  
  private let userPath = "/users/"
  private let vehiclePath = "/vehicles"
  let networkClient = NetworkClient()
  
  func getVehicles()-> Observable<ApiResult<VehicleResponse>> {
    let userId = UserLocalDataSource().getToken(key: "userId")
    let URL = "\(userPath)\(userId)\(vehiclePath)"
    return networkClient.get(path: URL).map { [weak self] response , object in

        switch response.statusCode {
        case 200 ... 299:
          return self?.mapResponseToApiResult(object) ?? ApiResult.error(DomainError(message: "Response is not valid"))
        default:
          print(response.statusCode)
          return ApiResult.error(DomainError(message: response.description))
        }
      }
  }
  
  func postVehicle(vehicleRequest: PostVehicleRequest) -> Observable<ApiResult<PostVehicleResponse>> {
    let userId = UserLocalDataSource().getToken(key: "userId")
    let URL = "\(userPath)\(userId)\(vehiclePath)"
    let encoder = JSONEncoder()
    var jsonQuery: [String:String]? = [:]
    do {
        let jsonData = try JSONEncoder().encode(vehicleRequest)
        jsonQuery = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: String]
        print(jsonQuery)
    } catch {
        print("Error encoding to JSON: \(error)")
    }
    
    
    return networkClient.post(path: URL, querry: jsonQuery ?? [:]).map { [weak self] response , object in
      
      switch response.statusCode {
      case 200 ... 299:
        return self?.mapPostResponseToApiResult(object) ?? ApiResult.error(DomainError(message: "Response is not valid"))
      default:
        print(response.statusCode)
        return ApiResult.error(DomainError(message: response.description))
        }
      }
    }
  
  func mapResponseToApiResult(_ response: Any) -> ApiResult<VehicleResponse> {
      var data: Data?
      if let responseDict = response as? [String: Any], let resultsData = responseDict["results"] {
          data = try? JSONSerialization.data(withJSONObject: resultsData, options: [])
      } else if let responseArray = response as? [Any] {
          data = try? JSONSerialization.data(withJSONObject: responseArray, options: [])
      }
      
      guard let responseData = data else {
          return .error(.init(message: "Data is not valid"))
      }
      
      do {
        let vehicleResponse = try JSONDecoder().decode([Vehicle].self, from: responseData)
        return .success(VehicleResponse(count: vehicleResponse.count, results: vehicleResponse))
      } catch {
          return .error(.init(message: "Data is not valid"))
      }
  }
  
  func mapPostResponseToApiResult(_ response: Any) -> ApiResult<PostVehicleResponse> {
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: response, options: [])
        let decoder = JSONDecoder()
        let vehicleResponse = try decoder.decode(PostVehicleResponse.self, from: jsonData)
        return .success(vehicleResponse)
    } catch {
        return .error(.init(message: "Data is not valid"))
    }
  }
  
  
//  func mapResponseToApiResult(_ response: Any) -> ApiResult<VehicleResponse> {
//      guard let data = try? JSONSerialization.data(withJSONObject: response, options: []),
//            let vehicleResponse = try? JSONDecoder().decode(VehicleResponse.self, from: data) else {
//        return .error(.init(message: "Data is not valid"))
//      }
//      return .success(vehicleResponse)
//  }
  
  public init(){}
}
