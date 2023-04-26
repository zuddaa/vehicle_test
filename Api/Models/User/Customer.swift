//
//  Customer.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

struct Customer: Codable {
    let credits: Int
    let id: String
    let name: String
    let status: String
    let phone: String?
    let address: String?
    let allowChilds: Bool
    let supportEmails: [String]
    let allowNegativeCredits: Bool
    let shadowType: String
    let removeReflectionsEnabled: Bool
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let parentId: String?
    let logoId: String?
    let logo: String?
}
