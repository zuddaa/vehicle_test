//
//  AuthentificationFeature.swift
//  Authentification
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import UIKit
import RxSwift
import RxCocoa
import Resolver
import Api

public struct AuthentificationFeature {
  
  public static func create(router: AuthRouter) -> UIViewController {
   // Resolver.register { UserDataRepository.self }.implements(UserRepository.self)
    return LoginViewController()
  }
}
