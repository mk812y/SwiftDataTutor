//
//  SwiftDataTutorApp.swift
//  SwiftDataTutor
//
//  Created by Михаил Куприянов on 3.10.23..
//

import SwiftData
import SwiftUI

@main
struct SwiftDataTutorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
