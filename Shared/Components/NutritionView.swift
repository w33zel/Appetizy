//
//  NutritionView.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 21.11.20.
//

import SwiftUI

struct NutritionView: View {
    let appetizer: Appetizer?

    var body: some View {
        HStack {
            VStack(spacing: 10) {
                Text("Calories")
                    .fontWeight(.semibold)
                Text("\(appetizer?.calories ?? 0)")
                    .fontWeight(.light)
                    .italic()
            }
            Divider()
                .frame(width: 3, height: 35)
            VStack(spacing: 10) {
                Text("Carbs")
                    .fontWeight(.semibold)
                Text("\(appetizer?.carbs ?? 0) g")
                    .fontWeight(.light)
                    .italic()
            }
            Divider()
                .frame(width: 2, height: 35)
            VStack(spacing: 10) {
                Text("Protein")
                    .fontWeight(.semibold)
                Text("\(appetizer?.protein ?? 0) g")
                    .fontWeight(.light)
                    .italic()
            }
        }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView(appetizer: MockData.testAppetizer)
            .previewLayout(.sizeThatFits)
    }
}
