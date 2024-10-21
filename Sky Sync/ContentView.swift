//
//  ContentView.swift
//  Sky Sync
//
//  Created by Andrea Bottino on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var model = Model()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Location", text: $model.searchLocation, prompt: Text("Type a location here"))
                Button("Search") {
                    Task {
                        await model.getCoordinates(for: model.searchLocation)
                        await model.getWeather(in: model.location)
                    }
                }
            }
            Spacer()
            VStack(spacing: 50) {
                Text(model.fullResult?.name ?? "")
                Image(systemName: model.getWeatherIcon(for: (model.fullResult?.weather[0].description) ?? "swift"))
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { size, axis in
                        size * 0.4
                    }
                Text("Min temp: \(model.fullResult?.main.temp_min ?? 0) deg")
                Text("Max temp: \(String(describing: model.fullResult?.main.temp_max ?? 0)) deg")
            }
            Spacer()
        }
        .padding()
        //        .onChange(of: model.location.lat) { oldValue, newValue in
        //           await model.getWeather(in: model.location)
        //        }
    }
}

#Preview {
    ContentView()
}
