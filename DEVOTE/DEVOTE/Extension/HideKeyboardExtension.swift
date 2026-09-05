//
//  HideKeyboardExtension.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 03/09/26.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resolveClassMethod), to: nil, from: nil, for: nil)
    }
}
#endif
