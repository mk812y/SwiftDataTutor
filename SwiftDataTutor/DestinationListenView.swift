//
//  DestinationListenView.swift
//  SwiftDataTutor
//
//  Created by Михаил Куприянов on 3.10.23..
//

import SwiftData
import SwiftUI

struct DestinationListenView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [Destination]
    
    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            
            }
            .onDelete(perform: deleteDestinations)
        }
    }
    
    init(sort: SortDescriptor<Destination>, searchString: String) {
//        let dateNow = Date.now
//        _destinations = Query(sort: [sort])
//        _destinations = Query(filter: #Predicate { $0.priority >= 2 }, sort: [sort])
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                true
            } else {
                $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListenView(sort: SortDescriptor(\Destination.name), searchString: "")
}
