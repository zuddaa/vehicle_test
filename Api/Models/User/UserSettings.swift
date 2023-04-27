//
//  UserSettings.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

struct UserSettings: Codable {
    let backgroundType: String
    let blurAmount: Int
    let defaultCropType: String
    let features: [String]
    let logoPosition: String
    let qualityCheck: Bool
    let showTutorials: Bool
    let speechCommands: Bool
    let lockCameraCapture: Bool
    let defaultPreset: String
    // Add any other user settings properties as needed
}
