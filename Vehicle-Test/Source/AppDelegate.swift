//
//  AppDelegate.swift
//  Vehicle Test
//
//  Created by Izudin Vragic on 25. 4. 2023..
//

import UIKit
import Authentification
import Api
import Resolver
import Home

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  @LazyInjected
  private var authUsecase: AuthenticationUseCase
  
  lazy var app: Coordinator  = {
    AppCoordinator(navigation: navigation, window: window)
  }()
  
  var window: UIWindow?
  let navigation = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
          window = UIWindow(frame: UIScreen.main.bounds)
          window?.makeKeyAndVisible()
          self.registerDependency()
          self.app.start()

        return true
    }
  func registerDependency(){
    Resolver
      .register { AuthUseCaseImpl() }
      .implements(AuthenticationUseCase.self)
      .scope(.application)
    
    Resolver.register {AuthRouting()}.implements(AuthRouter.self).scope(.application)
    Resolver.register {HomeRouting(navigation: self.navigation)}.implements(HomeRouter.self).scope(.application)
    Resolver.registerRepositories()
    Resolver.registerVehicleRepository()
    
  }
    // MARK: UISceneSession Lifecycle


}

extension Resolver {
    static func registerRepositories() {
        register(UserRepository.self) {
            UserDataRepository()
        }
      register { UserRemoteDataSource() }
      register { UserLocalDataSource() }
      register { UserNetworkService() }
    }
  static func registerVehicleRepository() {
    register(VehicleRepository.self) {
      VehicleDataRepository()
    }
    register { VehicleRemoteDataSource() }
    register { VehiclesNetworkService() }
    register { VehicleLocalDataSource() }
  }
  
  
}
