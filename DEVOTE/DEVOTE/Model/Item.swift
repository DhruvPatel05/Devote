//
//  Item.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 25/08/26.
//

import Foundation
import SwiftData

@Model
final class Item {

    var timestamp: Date
    var task: String
    var completion: Bool

    init(
        timestamp: Date = .now,
        task: String,
        completion: Bool = false
    ) {
        self.timestamp = timestamp
        self.task = task
        self.completion = completion
    }
}
