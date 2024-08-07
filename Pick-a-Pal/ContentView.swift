//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Nick Krasnitskiy on 02.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            Text(pickedName.isEmpty ? " " : pickedName)
            
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            
            TextField("Add name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            Divider()
            
            Toggle("Remove then picked", isOn: $shouldRemovePickedName)
            
            Button {
                if let randonName = names.randomElement() {
                    pickedName = randonName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return (name == randonName)
                        }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
               Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
