//
//  UserNetworkService.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Alamofire

public class UserNetworkService {
  
  private let LOGIN_PATH = "/login"
  
  public init(){}
  
  //MARK: Login API
  func login(loginRequest: UserLoginRequest, completion: @escaping ([String : String]) -> (), failure: @escaping (String) -> ()){
    let loginData = [
      "email" : loginRequest.email,
      "password" : loginRequest.password
    ]
    
    let URL = "\(NetworkConstants.baseURL)\(LOGIN_PATH)"
AF.request(URL, method: .post, parameters: loginData).responseDecodable(of: UserLoginResponse.self) { response in
      guard let token = response.value?.token, let userId = response.value?.user.id else {
        failure(response.debugDescription)
        return
      }
      let tokens = [
        "token" : token,
        "userId" : userId
      ]
      completion(tokens)
    }
  }
}
