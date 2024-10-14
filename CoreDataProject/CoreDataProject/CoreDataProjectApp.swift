//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Joyse Vargas on 16/8/24.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
