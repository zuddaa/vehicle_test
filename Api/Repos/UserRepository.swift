//
//  UserRepository.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public protocol UserRepository {
  
    func login(requestModel: UserLoginRequest, completion: @escaping () -> (), failure: @escaping (String) -> ())
}
