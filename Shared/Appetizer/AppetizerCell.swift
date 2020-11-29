//
//  AppetizerCell.swift
//  Appetizy
//
//  Created by Christian Arlt on 13.11.20.
//

import SwiftUI

struct AppetizerCell: View {
    let appetizer: Appetizer

    var body: some View {
        HStack {
            AppetizerRemoteImage(imageURL: appetizer.imageURL)
                .aspectRatio(1.33, contentMode: .fit)
                .frame(width: 120)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
                Text("$ \(String(format: "%.2f", appetizer.price))")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
<<<<<<< Updated upstream
            .padding(.leading)
        }
        .onAppear {
            print("AppetizerCell appear")
            NetworkManager.shared.loadImage(at: appetizer.imageURL) { uiImage in
                guard let uiImage = uiImage else { return }
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
=======
            Spacer()
>>>>>>> Stashed changes
        }
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCell(appetizer: MockData.testAppetizer)
    }
}
 
