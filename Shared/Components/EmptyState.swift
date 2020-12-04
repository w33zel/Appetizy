//
//  EmptyState.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 04.12.20.
//

import SwiftUI

struct EmptyState: View {
    let type: EmptyStateType
    let message: String
    
    enum EmptyStateType: String {
        case order = "empty-order"
    }
    
    var body: some View {
        VStack {
            Image(type.rawValue)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 70)
            Text(message)
                .font(.title)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(type: .order, message: "No orders, go order some.\nAnd a second line with a longer text to see how that looks.")
    }
}
