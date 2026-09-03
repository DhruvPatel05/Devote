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

            VStack {

                // MARK: - NEW TASK
                VStack(spacing: 16) {

                    TextField("New Task", text: $task)
                        .padding()
                        .background(
                            Color(UIColor.systemGray6)
                        )
                        .cornerRadius(10)

                    Button(action: addItem) {

                        HStack {
                            Text("SAVE")
                            Spacer()
                        }
                    }
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(10)
                    .disabled(
                        task.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        ).isEmpty
                    )

                }
                .padding()

                // MARK: - TASK LIST
                List {

                    ForEach(items) { item in

                        NavigationLink {

                            VStack {
                                Text(item.task)

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
            }
            .navigationTitle("Daily Tasks")
            .toolbar {

                ToolbarItem(
                    placement: .navigationBarTrailing
                ) {
                    EditButton()
                }
            }

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
