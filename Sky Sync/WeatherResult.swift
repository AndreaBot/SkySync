//
//  WeatherResult.swift
//  Sky Sync
//
//  Created by Andrea Bottino on 21/10/2024.
//

import Foundation

struct WeatherResult: Codable {
    var weather: [Weather]
    var main: Main
    var name: String
}

struct Weather: Codable {
    var description: String
}

struct Main: Codable {
    var temp_min: Double
    var temp_max: Double
}
