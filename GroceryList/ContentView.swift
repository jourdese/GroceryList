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
    
    @State private var item: String = ""
    
    func addEssentialFoods() {
        modelContext.insert(Item(title: "Milk", isCompleted: false))
        modelContext.insert(Item(title: "Bread", isCompleted: true))
        modelContext.insert(Item(title: "Cheese", isCompleted: false))
        modelContext.insert(Item(title: "Pasta", isCompleted: Bool.random()))
        modelContext.insert(Item(title: "Soda", isCompleted: Bool.random()))
    }
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(items) { item in
                    Text(item.title)
                        .font(.title.weight(.light))
                        .padding(.vertical,2)
                        .foregroundStyle(item.isCompleted == false ? Color.primary : Color.accentColor)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                        .swipeActions {Button(role: .destructive){
                            withAnimation {
                                modelContext.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                        .swipeActions(edge: .leading) {
                            Button("Done", systemImage: item.isCompleted == false ? "checkmark.circle" :"x.circle") {
                                item.isCompleted.toggle()
                            }
                            .tint(item.isCompleted == false ? .green : .accentColor)
                        }
                }
            }
            .navigationBarTitle("Grocery List")
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing){
                        Button {
                            addEssentialFoods()
                        } label: {
                            Label("Essentials", systemImage: "carrot")
                        }
                    }
                }

            }
            .safeAreaInset(edge: .bottom){
                VStack(spacing: 12) {
                    TextField("", text: $item)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(.tertiary)
                        .cornerRadius(12)
                        .font(.title.weight(.light))
                    Button {
                        let newItem = Item(title: item, isCompleted: false)
                        modelContext.insert(newItem)
                    }label: {
                        Text("Save")
                            .font(.title2.weight(.medium))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.extraLarge)
                }
                .padding()
                .background(.bar)
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView("Empty Cart", systemImage: "cart.circle", description: Text("Add some items to the shopping cart."))
                }
            }
        }
    }
}

#Preview("List with Items") {
    let sampleData: [Item] = [
        Item(title: "Milk", isCompleted: false),
        Item(title: "Bread", isCompleted: true),
        Item(title: "Cheese", isCompleted: false),
        Item(title: "Pasta", isCompleted: Bool.random()),
        Item(title: "Soda", isCompleted: Bool.random())
    ]
    
    let container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
                                        
    for item in sampleData {
        container.mainContext.insert(item)
    }
    
    return ContentView()
    .modelContainer(container)
}


#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
