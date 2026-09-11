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
                .background(isButtonDisabled ? Color.gray : Color.pink)
                .cornerRadius(10)
                .disabled(
                    isButtonDisabled
                )
            }
            .padding(.horizontal)
            .padding(.vertical,20)

        }//: VSTACK
        
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
