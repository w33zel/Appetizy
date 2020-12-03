//
//  OrderView.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 13.11.20.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject private var model: AppertizyModel
    
    let edgeInsets = EdgeInsets(top: -1, leading: -1, bottom: -1, trailing: -1)
    
    var body: some View {
        VStack {
            List {
                ForEach(model.order.appetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .listRowInsets(edgeInsets)
                        .background(Color(.systemBackground))
                }
                .onDelete(perform: model.removeOrder)
            }
            .listStyle(PlainListStyle())
            
            AddOrderButton(price: model.order.finalPrice, action: { })
                .padding(.bottom)
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
                .preferredColorScheme(.light)
        }
    }
}
