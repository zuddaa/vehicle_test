//
//  DomainError.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public class DomainError: Error {
    let message: String

    init(message: String) {
        self.message = message
    }
}
