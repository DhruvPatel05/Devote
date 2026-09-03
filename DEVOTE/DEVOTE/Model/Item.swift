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
    
    init(timestamp: Date,task: String) {
        self.timestamp = timestamp
        self.task = task
    }
}
