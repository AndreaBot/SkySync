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
            TextField("Location", text: $model.searchLocation, prompt: Text("Type a location here"))
            Button("Print") {
                Task {
                    await model.getCoordinates(for: model.searchLocation)
                    await model.getWeather(in: model.location)
                }
            }
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
