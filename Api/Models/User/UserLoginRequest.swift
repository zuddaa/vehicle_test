//
//  UserLoginRequest.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public struct UserLoginRequest: Codable {
    
    let email: String
    let password: String
    
  public init(username: String, password: String) {
    self.email = username
    self.password = password
  }
    
}
