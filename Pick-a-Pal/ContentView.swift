//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Nick Krasnitskiy on 02.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
