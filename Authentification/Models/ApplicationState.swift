//
//  ApplicationState.swift
//  Authentification
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation
import Api

public enum ApplicationState: Equatable {
    public static func == (lhs: ApplicationState, rhs: ApplicationState) -> Bool {
        switch (lhs, rhs) {
        case (.logedOut, .logedOut):
            return true
        case (.loggedIn, .loggedIn):
           return false
        default:
            return false
        }
    }
    
    case logedOut,
         loggedIn
}
