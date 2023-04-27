//
//  NetworkClient.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Alamofire
import Foundation
import ObjectMapper
import RxAlamofire
import RxSwift
import Resolver

class NetworkClient {
        
    func get(path: String) -> Observable<(HTTPURLResponse, Any)> {
      let accessToken = UserLocalDataSource().getToken(key: "token")
      let headers: HTTPHeaders = [
          .authorization(bearerToken: accessToken)
      ]
        return requestJSON(
            .get,
            "\(NetworkConstants.baseURL)/\(path)",
            headers: headers
        )
    }

    func get(path: String, parameters: [String: Any]) -> Observable<(HTTPURLResponse, Any)> {
        return requestJSON(
            .get,
            "\(NetworkConstants.baseURL)/\(path)",
            parameters: parameters
        )
    }
    
    func get(path: String, querry: [String: Any]) -> Observable<(HTTPURLResponse, Any)> {
        return requestJSON(
            .get,
            "\(NetworkConstants.baseURL)/\(path)",
            parameters: querry,
            encoding: URLEncoding.queryString,
            headers: ["Content-Type": "application/json"]
        )
    }

    func post(path: String, querry: [String: Any]) -> Observable<(HTTPURLResponse, Any)> {
      let accessToken = UserLocalDataSource().getToken(key: "token")
      let headers: HTTPHeaders = [
          .authorization(bearerToken: accessToken),
          .contentType("application/json")
      ]
        return requestJSON(
            .post,
            "\(NetworkConstants.baseURL)/\(path)",
            parameters: querry,
            encoding: JSONEncoding.default,
            headers: headers
            
        )
    }
}
