//
//  DevoteWidgetBundle.swift
//  DevoteWidget
//
//  Created by Dhruv Patel on 04/10/26.
//

import WidgetKit
import SwiftUI

@main
struct DevoteWidgetBundle: WidgetBundle {
    var body: some Widget {
        DevoteWidget()
        DevoteWidgetControl()
        DevoteWidgetLiveActivity()
    }
}
