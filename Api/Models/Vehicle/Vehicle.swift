//
//  Vehicle.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public struct Vehicle: Codable {
    public let imageCount: ImageCount
    public let id: String
    public let catcherId: String?
    public let createdAt: String
    public let updatedAt: String
    public let deletedAt: String?
    public let userId: String
    public let vehicleId: String
    public let requestId: String?
    public let vehicleInfo: VehicleInfo
    public let requestInfo: String?
    public let coverImage: String?
}

