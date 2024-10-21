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
            TextField("Location", text: $model.location, prompt: Text("Type a location here"))
            Button("Print") {
                print(model.location)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
