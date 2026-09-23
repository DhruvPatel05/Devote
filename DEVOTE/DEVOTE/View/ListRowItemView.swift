//
//  ListRowItemView.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 20/09/26.
//

import SwiftUI
import SwiftData

struct ListRowItemView: View {

    @Bindable var item: Item
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundStyle(item.completion ? .pink : .primary)
                .padding(.vertical,12)
                .animation(.default)
        } //: TOGGLE
        .onChange(of: item.completion) {
            print(item.completion)
        }
    }
}
