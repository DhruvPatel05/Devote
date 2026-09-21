//
//  ListRowItemView.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 20/09/26.
//

import SwiftUI

struct ListRowItemView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservableObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2,design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
        }
    }
}
