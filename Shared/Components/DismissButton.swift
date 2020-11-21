//
//  DismissButton.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 22.11.20.
//

import SwiftUI

struct DismissButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .padding(10)
                .background(Color.white.opacity(0.5))
                .clipShape(Circle())
                .padding(5)
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton(action: { })
            .previewLayout(.sizeThatFits)
    }
}
