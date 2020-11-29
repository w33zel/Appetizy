//
//  OrderView.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 13.11.20.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject private var model: AppertizyModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(model.order.appetizers) { appetizer in
                        AppetizerCell(appetizer: appetizer)
                    }
                }
            }
            AddOrderButton(price: model.order.finalPrice, action: { })
        }
        .navigationTitle("☝️ Orders")
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderView()
                .navigationTitle("☝️ Orders")
                .environmentObject(AppertizyModel())
        }
    }
}
