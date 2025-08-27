//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by Jourdese Palacio on 8/27/25.
//

import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
