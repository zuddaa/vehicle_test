//
//  AuthUseCaseImpl.swift
//  Vehicle-Test
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Authentification
import Resolver

class AuthUseCaseImpl: AuthenticationUseCase {
  var state: ((Authentification.ApplicationState) -> Void)?
}
