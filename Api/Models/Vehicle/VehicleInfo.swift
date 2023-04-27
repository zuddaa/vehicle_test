//
//  VehicleInfo.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public struct VehicleInfo: Codable {
    let completedProcessing: Int
    let failedProcessing: Int
    let isProcessing: Bool
    let isProcessed: Bool
    let processing: Int
    let status: String
    let importStatus: String
    let isUploaded: Bool
    let id: String
    let vin: String
    let make: String?
    let model: String?
    let displacement: String?
    let horsePower: String?
    let description: String?
    let bodyType: String?
    let fuelType: String?
    let count: Int
    let visible: Bool
    let features: [String]
    let equipment: String?
    let cropType: String
    let createdAt: String
    let updatedAt: String
    let deletedAt: String?
    let clientLicensePlateId: String?
    let presetId: String
    let vehicleBodyTypeId: String?
    let profileId: String?
    let vehicleTypeId: String?
    let isImported: Bool
    let areImagesImported: Bool
}
