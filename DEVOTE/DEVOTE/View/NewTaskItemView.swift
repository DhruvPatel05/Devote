//
//  NewTaskItemView.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 08/09/26.
//

import SwiftUI
import SwiftData

struct NewTaskItemView: View {
    // MARK: - PROPERTY
    private var isButtonDisabled: Bool { task.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    @State private var showNewTaskItem: Bool = false
    // MARK: -  FUNCTION
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
    

    
    // MARK: -  BODY
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        Color(UIColor.systemGray6)
                    )
                    .cornerRadius(10)
                
                Button(action: addItem) {
                    
                    HStack {
                        Text("SAVE")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer()
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(10)
                .disabled(
                    isButtonDisabled
                )
            }
            .padding(.horizontal)
            .padding(.vertical,20)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.65), radius: 24)
            .frame(maxWidth:640)
        }//: VSTACK
        .padding()
    }
}

// MARK: -  PREVIEW

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView()
            .previewDevice(PreviewDevice("iPhone 12 Pro"))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
