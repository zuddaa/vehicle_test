//
//  LoginViewModel.swift
//  Authentification
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Api
import Resolver

class LoginViewModel {
  
  @LazyInjected
  private var userRepository: UserRepository
  
  @LazyInjected
  private var router: AuthRouter
  
  
  func loginWith(email: String, password: String) {
    let userRepository = Resolver.resolve(UserRepository.self)
    userRepository.login(requestModel: UserLoginRequest(username: email, password: password)) { [weak self] in
      self?.router.loggedIn()
      
    } failure: { error in
      print("zuddda")
      print(error)
    }

  }
}
