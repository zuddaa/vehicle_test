//
//  UserDataRepository.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Alamofire
import Resolver

public class UserDataRepository: UserRepository {
    
    @Injected
    private var userRemoteDataSource: UserRemoteDataSource
    @Injected
    private var userLocalDataSource: UserLocalDataSource
  
  public init(){
    
  }
    
//MARK: - LOGIN
  public func login(requestModel: UserLoginRequest, completion: @escaping () -> (), failure: @escaping (String) -> ()) {
        userRemoteDataSource.login(requestModel: requestModel) { [self] tokens in
            self.userLocalDataSource.saveTokens(tokens: tokens)
            completion()
        } failure: { errorUserLogin in
            failure(errorUserLogin)
        }
    }

//MARK: - LOGOUT
    func logout() {
        // TODO
    }
}
