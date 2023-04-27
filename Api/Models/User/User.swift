//
//  User.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

struct User: Codable {
    let legacyPayment: Bool
    let credit: Credit
    let id: String
    let email: String
    let name: String
    let status: String
    let token: String?
    let phone: String?
    let lastTimeOnline: String
    let address: String?
    let maxCount: Int
    let qcEnabled: Bool
    let manualQcEnabled: Bool
    let licensePlateEnabled: Bool
    let reflectiveFloorEnabled: Bool
    let vinScannerEnabled: Bool
    let exposureFilterEnabled: Bool
    let legacyShadow: Bool
    let shadowType: String
    let readOnlyPermissions: Bool
    let priority: String?
    let interiorBackgroundEnabled: Bool
    let removeReflectionsEnabled: Bool
    let additionalInvoiceInfo: String?
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let clientId: String
    let customerId: String
    let roleId: String
    let profilePictureId: String?
    let profilePicture: String?
    let customer: Customer
    let client: Client
    let role: Role
    let userSettingsMode: String
    let userSettings: UserSettings
}
