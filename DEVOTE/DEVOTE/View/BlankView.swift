//
//  BlankView.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 12/09/26.
//

import SwiftUI

struct BlankView: View {
    // MARK: -  PROPERTY
    
    
    
    // MARK: -  BODY

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity,alignment: .center)
        .background(Color.black)
    }
}

#Preview {
    BlankView()
}
