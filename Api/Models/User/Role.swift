//
//  Role.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

struct Role: Codable {
    let id: String
    let name: String
    let type: String
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
}
