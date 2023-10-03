//
//  ContentView.swift
//  SwiftDataTutor
//
//  Created by Михаил Куприянов on 3.10.23..
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListenView(sort: sortOrder, searchString: searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar {
//                    Button("Add Samples", action: addSamples)
                    Button("Add destination", systemImage: "plus", action: addDestination)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Destination.name))
                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))
                            Text("Date")
                                .tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
//    func addSamples() {
//        let rome = Destination(name: "Rome")
//        let florence = Destination(name: "Florence")
//        let naples = Destination(name: "Naples")
//        
//        modelContext.insert(rome)
//        modelContext.insert(florence)
//        modelContext.insert(naples)
//    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
}
