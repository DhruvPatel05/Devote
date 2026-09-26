//
//  Untitled.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 25/09/26.
//
import SwiftUI

struct CheckboxStyle: View {
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
