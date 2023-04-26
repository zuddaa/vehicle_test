//
//  UserRemoteDataSource.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Resolver

public class UserRemoteDataSource {
    @LazyInjected
    private var userNetworkService: UserNetworkService
    

  public init(){
    
  }

    //MARK: - LOGIN
    func login(requestModel: UserLoginRequest, completion: @escaping ([String : String]) -> (), failure: @escaping (String) -> ()) {
        userNetworkService.login(loginRequest: requestModel) { tokens in
            completion(tokens)
        } failure: { errorUserLogin in
            failure(errorUserLogin)
        }
    }
       
   //MARK: - LOGOUT
       func logout() {
           // TODO
       }
       
   }

