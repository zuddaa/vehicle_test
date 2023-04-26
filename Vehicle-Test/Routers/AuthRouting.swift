//
//  AuthRouting.swift
//  Vehicle-Test
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import UIKit
import Authentification
import Resolver

class AuthRouting: AuthRouter {
  
  @LazyInjected
  private var authUsecase: AuthenticationUseCase
  
  func loggedIn() {
    authUsecase.state?(.loggedIn)
  }
}
