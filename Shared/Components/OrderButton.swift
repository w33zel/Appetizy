//
//  AddOrderButton.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 22.11.20.
//

import SwiftUI

struct OrderButton: View {
    @EnvironmentObject private var model: AppertizyModel
    
    let type: OrderButtonType
//    let price: Double?
//    let action: () -> Void
    
    enum OrderButtonType: String {
        case addOrder = "Add to Order"
        case placeOrder = "Place Order"
    }
    
    var body: some View {
        Button(action: model.addOrder) {
            HStack {
                Spacer()
                Text("$ \(String(format: "%.2f", model.selectedAppetizer?.price ?? 0)) - \(type.rawValue)")
                    .fontWeight(.medium)
                Spacer()
            }
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .font(.title2)
            .cornerRadius(30)
            .padding(.horizontal)
        }
    }
}

struct AddOrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(type: .addOrder)
            .environmentObject(AppertizyModel())
            .previewLayout(.sizeThatFits)
    }
}
