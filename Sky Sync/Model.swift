//
//  Model.swift
//  Sky Sync
//
//  Created by Andrea Bottino on 21/10/2024.
//

import Foundation

@Observable
final class Model {
    
    let apiKey = "7ffc5ff4685e72912c27d1c7a675d56c"
    var searchLocation = ""
    
    var location = MyLocation(name: "", lat: 0, lon: 0)
    
    func getCoordinates(for place: String) async {
        let baseGeocodingLink = "https://api.openweathermap.org/geo/1.0/direct?q=\(place)&appid=7ffc5ff4685e72912c27d1c7a675d56c"
        
        if let url = URL(string: baseGeocodingLink) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedData = try? JSONDecoder().decode([MyLocation].self, from: data) {
                    location = MyLocation(name: decodedData[0].name, lat: decodedData[0].lat, lon: decodedData[0].lon)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
