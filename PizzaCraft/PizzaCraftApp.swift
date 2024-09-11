//
//  PizzaCraftApp.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI

@main
struct PizzaCraftApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ShoppingCart())
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
