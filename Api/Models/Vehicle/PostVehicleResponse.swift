//
//  PostVehicleResponse.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public struct PostVehicleResponse: Codable {
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
    let processings: Processings
    let imports: Imports
    let vehicleBodyType: VehicleBodyType
}

public struct Processings: Codable {
    let id: String?
    let type: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let vehicleId: String?
}

public struct Imports: Codable {
    let id: String?
    let status: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let importerId: String?
    let vehicleId: String?
}

public struct VehicleBodyType: Codable {
    let id: String?
    let name: String?
    let value: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let files: Files
}

public struct Files: Codable {
    let id: String?
    let filename: String?
    let path: String?
    let size: String?
    let type: String?
    let isPrimary: Bool?
    let legacy: String?
    let contentType: String?
    let visible: Bool?
    let meta: String?
    let qc: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let dmsId: String?
    let imageId: String?
    let fileVehicleBodyTypes: FileVehicleBodyTypes
}

public struct FileVehicleBodyTypes: Codable {
    let fileId: String?
    let vehicleBodyTypeId: String?
    let createdAt: String?
    let updatedAt: String?
}
