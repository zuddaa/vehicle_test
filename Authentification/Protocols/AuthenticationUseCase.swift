//
//  AuthenticationUseCase.swift
//  Authentification
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public protocol AuthenticationUseCase {
  var state: ((ApplicationState) -> Void)? { get set }
}
