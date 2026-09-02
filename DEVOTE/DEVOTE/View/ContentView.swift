//
//  ContentView.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 25/08/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext

    @Query(sort: \Item.timestamp, order: .forward)
    private var items: [Item]
    @State var task: String = ""
    
    var body: some View {
        NavigationSplitView {
            VStack {
                VStack(spacing: 16){
                    TextField("New Task",text:$task)
                        .padding()
                        .background(
                            Color(UIColor.systemGray6)
                        )
                        .cornerRadius(10)
                    Button(action: {
                        addItem()
                    }, label:{
                        Text("SAVE")
                        Spacer()
                    })
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(10)
                }//: VSTACK
                .padding()
                
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text(
                                "Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))"
                            )
                        } label: {
                            Text(
                                item.timestamp,
                                format: Date.FormatStyle(date: .numeric, time: .standard)
                            )
                        }
                    }
                    .onDelete(perform: deleteItems)
                }//:LIST
            }//:VSTACK
            .navigationBarTitle("Daily Tasks", displayMode:.large)
            
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }//: TOOLBAR
            }//: NAVIGATION
        
            detail: {
                Text("Select an item")
            }
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
//            newItem.id = UUID()
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
