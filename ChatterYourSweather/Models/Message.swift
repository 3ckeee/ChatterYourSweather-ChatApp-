//
//  Message.swift
//  ChatterYourSweather
//
//  Created by Erik Kokinda on 02/10/2022.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}

