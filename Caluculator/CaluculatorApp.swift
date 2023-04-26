//
//  CaluculatorApp.swift
//  Caluculator
//
//  Created by 加藤巧真 on 2023/04/26.
//

import SwiftUI

@main
struct CaluculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
