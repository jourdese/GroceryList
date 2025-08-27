//
//  ContentView.swift
//  GroceryList
//
//  Created by Jourdese Palacio on 8/27/25.
//  CommitName: User Interface

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(items) { item in
                    Text(item.title)
                }
            }
            .navigationBarTitle("Grocery List")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
