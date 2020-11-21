//
//  AddOrderButton.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 22.11.20.
//

import SwiftUI

struct AddOrderButton: View {
    let price: Double
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text("$ \(String(format: "%.2f", price)) - Add to Order")
                    .fontWeight(.medium)
                Spacer()
            }
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .font(.title2)
            .cornerRadius(25)
            .padding(.horizontal)
        }
    }
}

struct AddOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderButton(price: 9.99, action: { })
            .previewLayout(.sizeThatFits)
    }
}
