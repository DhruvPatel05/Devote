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

    @State private var task: String = ""
    var body: some View {

        NavigationSplitView {
            ZStack {
                // MARK: -  MAIN VIEW
                VStack {
                    // MARK: -  HEADER

                    // MARK: - NEW TASK BUTTON
                    
                    
                    // MARK: - TASK LIST
                    List {
                        
                        ForEach(items) { item in
                            
                            NavigationLink {
                                
                                VStack (alignment: .leading){
                                    Text(item.task ?? "")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    
                                    Text(
                                        item.timestamp,
                                        format: Date.FormatStyle(
                                            date: .numeric,
                                            time: .standard
                                        )
                                    )
                                }
                                
                            } label: {
                                
                                Text(item.task)
                                
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color.init(red: 0, green: 0, blue: 0,opacity: 0.3), radius: 12)
                    .padding(.vertical,0)
                }
            }
            .onAppear(){
                UITableView.appearance().backgroundColor = .clear
            }
            .navigationTitle("Daily Tasks")
            .toolbar {

                ToolbarItem(
                    placement: .navigationBarTrailing
                ) {
                    EditButton()
                }
            }
            .background(
                BackgroundImageView()
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all)
            )
        } detail: {

            Text("Select a task")

        }
    }

    // MARK: - ADD TASK

    private func addItem() {

        let trimmedTask = task.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !trimmedTask.isEmpty else {
            return
        }

        withAnimation {

            let newItem = Item(
                timestamp: Date(),
                task: trimmedTask
            )

            modelContext.insert(newItem)

            task = ""
            hideKeyboard()
        }
    }

    // MARK: - DELETE TASK

    private func deleteItems(offsets: IndexSet) {

        withAnimation {

            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}


// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        ContentView()
            .modelContainer(
                for: Item.self,
                inMemory: true
            )
    }
}
