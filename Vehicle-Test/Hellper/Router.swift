//
//  Router.swift
//  Vehicle-Test
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import UIKit

final class Router: NSObject {
  
  public weak var rootController: UINavigationController?
  private weak var window: UIWindow?
  private var completions: [UIViewController : () -> Void]
  
  init(rootController: UINavigationController?, window: UIWindow?) {
    self.rootController = rootController
    self.window = window
    self.completions = [:]
  }
  
  func toPresent() -> UIViewController? {
    return self.rootController
  }
  
  func present(_ module: UIViewController?) {
    self.present(module, animated: true, completion: nil)
  }
  
  func present(_ viewController: UIViewController?, animated: Bool, completion: (() -> Void)?) {
    guard let controller = viewController else { return }
    self.rootController?.present(controller, animated: animated, completion: completion)
  }
  
  func dismissModule() {
    self.dismissModule(animated: true, completion: nil)
  }
  
  func dismissModule(animated: Bool, completion: (() -> Void)?) {
    self.rootController?.dismiss(animated: animated, completion: completion)
  }
  
  func push(_ viewController: UIViewController?) {
    self.push(viewController, animated: true)
  }
  
  func push(_ viewController: UIViewController?, hideBottomBar: Bool) {
    self.push(viewController, animated: true, hideBottomBar: hideBottomBar, completion: nil)
  }
  
  func push(_ viewController: UIViewController?, animated: Bool) {
    self.push(viewController, animated: animated, completion: nil)
  }
  
  func push(_ viewController: UIViewController?, animated: Bool, completion: (() -> Void)?) {
    self.push(viewController, animated: animated, hideBottomBar: false, completion: completion)
  }
  
  func push(_ viewController: UIViewController?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
    guard
      let controller = viewController,
      (controller is UINavigationController == false)
    else { assertionFailure("Deprecated push UINavigationController."); return }
    
    if let completion = completion {
      self.completions[controller] = completion
    }
    controller.hidesBottomBarWhenPushed = hideBottomBar
    self.rootController?.pushViewController(controller, animated: animated)
  }
  
  func popModule() {
    self.popModule(animated: true)
  }
  
  func popModule(animated: Bool) {
    if let controller = rootController?.popViewController(animated: animated) {
      self.runCompletion(for: controller)
    }
  }
  
  func setRootModule(_ viewController: UIViewController?) {
    self.setRootModule(viewController, hideBar: false)
  }
  
  func setRootModule(_ viewController: UIViewController?, hideBar: Bool, isTransparent: Bool = false) {
    guard let controller = viewController else { return }
    self.rootController?.dismiss(animated: false)
    self.rootController?.setViewControllers([controller], animated: false)
    self.rootController?.isNavigationBarHidden = hideBar
    if isTransparent {
      self.rootController?.navigationBar.makeTransparent(withTint: .red)
    }
    self.window?.rootViewController = self.rootController
  }
  
  func popToRootModule(animated: Bool) {
    if let controllers = self.rootController?.popToRootViewController(animated: animated) {
      controllers.forEach { controller in
        self.runCompletion(for: controller)
      }
    }
  }
  
  private func runCompletion(for controller: UIViewController) {
    guard let completion = self.completions[controller] else { return }
    completion()
    self.completions.removeValue(forKey: controller)
  }
}

extension UINavigationBar {
  /// Make navigation bar transparent.
  ///
  /// - Parameter tint: tint color (default is .white).
  func makeTransparent(withTint tint: UIColor = .white) {
    isTranslucent = true
    backgroundColor = .clear
    barTintColor = .clear
    setBackgroundImage(UIImage(), for: .default)
    tintColor = .white
    titleTextAttributes = [.foregroundColor: tint]
    shadowImage = UIImage()
  }
}
