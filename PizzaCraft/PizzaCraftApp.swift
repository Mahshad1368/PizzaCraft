//
//  PizzaCraftApp.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI

@main
struct PizzaCraftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ShoppingCart())
        }
    }
}
