//
//  SavedLocations.swift
//  Sky Sync
//
//  Created by Andrea Bottino on 22/10/2024.
//

import SwiftUI

struct SavedLocations: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Button("Cancel") { dismiss() }
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    SavedLocations()
}
