//
//  AppetizerDetailView.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 21.11.20.
//

import SwiftUI

struct AppetizerDetailView: View {
    @State private var image = Image("food-placeholder")
    @EnvironmentObject var model: AppertizyModel

    var body: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .systemUltraThinMaterial) { }
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { model.clearSelectedAppetizer() }
            
            ZStack(alignment: .topTrailing) {
                VStack {
                    image
                        .resizable()
                        .scaledToFit()
                    VStack(spacing: 20) {
                        Text(model.selectedAppetizer?.name ?? "")
                            .font(.title)
                            .fontWeight(.medium)
                            .lineLimit(2)
                            .minimumScaleFactor(0.8)
                            .multilineTextAlignment(.center)
                        Text(model.selectedAppetizer?.description ?? "")
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    NutritionView(appetizer: model.selectedAppetizer)
                    Spacer()
                    AddOrderButton(price: model.selectedAppetizer?.price ?? 0, action: { })
                    Spacer()
                }
                DismissButton(action: { model.clearSelectedAppetizer() })
            }
            .background(Color(.systemBackground))
            .frame(width: 320, height: 525)
            .cornerRadius(15)
        }
        .onAppear {
            print("AppetizerDetailView appear")
            NetworkManager.shared.loadImage(at: model.selectedAppetizer?.imageURL) { uiImage in
                guard let uiImage = uiImage else { return }
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView()
            .environmentObject(AppertizyModel())
    }
}
