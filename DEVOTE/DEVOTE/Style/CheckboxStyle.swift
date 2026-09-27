//
//  Untitled.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 25/09/26.
//
import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Self..Configuration) -> some View {
    return HStack {
        Image(systemName: configuration.isOn ? "checkmark.circle.fill": "circle" )
            .foregroundColor(configuration.isOn ? .pink : .primary)
        }
    }
    var body: some View {
        Text("Hello, World!")
    }
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder label", isOn: .constant(true))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
