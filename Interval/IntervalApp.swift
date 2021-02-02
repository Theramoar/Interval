//
//  IntervalApp.swift
//  Interval
//
//  Created by Misha Kuznecov on 02/02/2021.
//

import SwiftUI

@main
struct IntervalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
