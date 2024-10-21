//
//  WeatherResult.swift
//  Sky Sync
//
//  Created by Andrea Bottino on 21/10/2024.
//

import Foundation

struct WeatherResult: Codable {
    var weather: [Weather]
}

struct Weather: Codable {
    var description: String
}
