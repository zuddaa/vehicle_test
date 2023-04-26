//
//  AppCoordinator.swift
//  Vehicle-Test
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Api
import Authentification
import Resolver
import UIKit


final class AppCoordinator: BaseCoordinator {
  
//  @LazyInjected
//  private var api: Api
//  @LazyInjected
//  var authAPI: AuthAPI
//  @BiometryAuthStorage
//  var bioAuthStorage: String?
//
  @LazyInjected
  private var authUsecase: AuthenticationUseCase
 
  lazy var main: Coordinator? =  {
    MainCoordinator(router: router)
  }()
  
  lazy var auth: Coordinator?  = {
    AuthCoordinator(router: router)
  }()
  
  public init(navigation: UINavigationController?, window: UIWindow?) {
    super.init()
    self.router = Router(rootController: navigation, window: window)
    
    self.authUsecase.state = { [weak self] in
      switch $0 {
      case .loggedIn:
        guard let main = self?.main ,
              let auth = self?.auth else { return }
        self?.removeDependency(auth)
        self?.addDependency(main)
        (main as? MainCoordinator)?.showHome()
      case .logedOut:
        guard let main = self?.main ,
              let auth = self?.auth else { return }
        self?.removeDependency(main)
        self?.addDependency(auth)
        auth.start()
      }
    }
  }

  // nakon sto se korisnik logira
  override func start() {
    auth?.start()
    //self.showLoaderView()
  }
  
//  private func showLoaderView() {
//    // controller with spinner Show spinner
//    self.router?.setRootModule(Controller {
//      let v = UIActivityIndicatorView()
//      v.style = .whiteLarge
//      v.hidesWhenStopped = true
//      v.startAnimating()
//      v.color = .white
//      v.backgroundColor = CommonUI.CommonUIColors.shared.authentication.backgroundColor()
//      return v
//    }, hideBar: true)
//  }
  
  deinit {
    print(#function, #line, #filePath)
  }
}
