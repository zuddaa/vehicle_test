//
//  Client.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

struct Client: Codable {
    let credits: Int
    let id: String
    let name: String
    let status: String
    let description: String?
    let icon: String?
    let email: String
    let country: String?
    let postCode: String?
    let city: String?
    let address: String?
    let notes: String?
    let paymentType: String
    let priority: String?
    let outputImageResolution: String?
    let interiorBackgroundEnabled: Bool
    let shadowType: String
    let numberId: String?
    let removeReflectionsEnabled: Bool
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let customerId: String
    let logoId: String?
    let logo: String?
}
