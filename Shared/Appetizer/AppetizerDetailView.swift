//
//  AppetizerDetailView.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 21.11.20.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(appetizer.imageURL.absoluteString)
                    .resizable()
                    .scaledToFit()
                VStack(spacing: 20) {
                    Text(appetizer.name)
                        .font(.title)
                        .fontWeight(.medium)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                        .multilineTextAlignment(.center)
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                
                Spacer()
                NutritionView(appetizer: appetizer)
                Spacer()
                AddOrderButton(price: appetizer.price, action: { })
                Spacer()
            }
            DismissButton(action: { })
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: Appetizer.testAppetizer)
            .previewLayout(.fixed(width: 350, height: 600))
    }
}
