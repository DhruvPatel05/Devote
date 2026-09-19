//
//  ContentView.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 25/08/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: -  PROPERTY
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \Item.timestamp, order: .forward)
    private var items: [Item]
    @State private var showNewTaskItem: Bool = false

    @State private var task: String = ""
    var body: some View {

        NavigationSplitView {
            ZStack {
                // MARK: -  MAIN VIEW
                VStack {
                    // MARK: -  HEADER
                    HStack(spacing:10) {
                        //: TITlE
                        Text("Devote")
                            .font(.system(.largeTitle,design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.leading,4)
                        //: EDIT BUTTON
                        EditButton()
                            .font(.system(size: 16,weight:.semibold,design: .rounded))
                            .padding(.horizontal,10)
                            .frame(minWidth: 70,maxWidth: 24)
                            .background(
                                Capsule().stroke(Color.white,lineWidth: 2)
                            )
                        //: APPEARNCE BUTTON
                        Button(action: {
                            isDarkMode.toggle()
                        }, label: {
                            Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                                .resizable()
                                .frame(width: 24,height: 24)
                                .font(.system(.title,design: .rounded))
                        }
                        )
                        //: HSTACK
                        
                    }.padding()
                        .foregroundColor(.white)
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
                    .frame(maxWidth:640)
                }//: VSTACK
                if showNewTaskItem {
                BlankView()
                        .onTapGesture {
                            withAnimation() {
                                showNewTaskItem = false
                            }
                        }
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
            }//: ZSTACK
            .onAppear(){
                UITableView.appearance().backgroundColor = .clear
            }
            .navigationBarTitle("Daily Tasks",displayMode:.large)
//            .toolbar {
//
//                ToolbarItem(
//                    placement: .navigationBarTrailing
//                ) {
//                    EditButton()
//                }
//            }
            .navigationBarHidden(true)
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
