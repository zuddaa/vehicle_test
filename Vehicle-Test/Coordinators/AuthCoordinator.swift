//
//  AuthCoordinator.swift
//  Vehicle-Test
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Authentification
import Api
import Resolver


final class AuthCoordinator: BaseCoordinator, AuthRouter {
  func loggedIn() {
    showMainApp()
  }

  
  private func logOutAndOpenLogin() {
    self.authUsecase.state?(.logedOut)
    self.openLogin()
  }
  
  @LazyInjected
  private var authUsecase: AuthenticationUseCase
  
  init(router: Router?) {
    super.init()
    self.router = router
  }
  
  override func start() {
    openLogin()
  }
  
  func openLogin() {
    let vc = AuthentificationFeature.create(router: self)
    router?.setRootModule(vc)
  }
  
  deinit {
    print(#function, #line, #filePath)
  }
  
  fileprivate func showError(for: Error?) {
    
  }

  
  fileprivate func showMainApp() {
    authUsecase.state?(.loggedIn)
  }

}
