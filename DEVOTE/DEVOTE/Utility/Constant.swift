//
//  Constant.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 05/09/26.
//

import SwiftUI


// MARK: - FORMATTER

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI
var backgroundGradient:LinearGradient {
    return  LinearGradient(gradient: Gradient(colors: [.pink,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: - UX

