//
//  BlankView.swift
//  DEVOTE
//
//  Created by Dhruv Patel on 12/09/26.
//

import SwiftUI

struct BlankView: View {
    // MARK: -  PROPERTY
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    
    // MARK: -  BODY

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity,alignment: .center)
        .background(Color.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: -  PREVIEW
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea(.all))
    }
}

