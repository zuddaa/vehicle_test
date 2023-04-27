//
//  UserLoginResponse.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public struct UserLoginResponse: Codable {
    let token: String
    let user: User
}
