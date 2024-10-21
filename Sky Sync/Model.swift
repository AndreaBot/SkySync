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
    var fullResult: WeatherResult?
    
    func getCoordinates(for place: String) async {
        let baseGeocodingLink = "https://api.openweathermap.org/geo/1.0/direct?q=\(place)&appid=7ffc5ff4685e72912c27d1c7a675d56c"
        
        guard let url = URL(string: baseGeocodingLink) else {
            print("invalid url!")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode([MyLocation].self, from: data) {
                if !decodedData.isEmpty {
                    location = MyLocation(name: decodedData[0].name, lat: decodedData[0].lat, lon: decodedData[0].lon)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getWeather(in place: MyLocation) async {
        fullResult = nil
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather?lat=\(place.lat)&lon=\(place.lon)&appid=7ffc5ff4685e72912c27d1c7a675d56c"
        
        guard let url = URL(string: baseUrl) else {
            print("invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode(WeatherResult.self, from: data) {
                fullResult = WeatherResult(weather: decodedData.weather)
            } else {
                print("Error decoding data")
            }
            
        } catch {
            
        }
    }
}
