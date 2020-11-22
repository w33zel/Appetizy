//
//  AppetizerListView.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 13.11.20.
//

import SwiftUI

struct AppetizerListView: View {
//    @StateObject var model = AppertizyModel()
    @EnvironmentObject var model: AppertizyModel
    
    var body: some View {
        ZStack {
            List(model.appetizers) { appetizer in
                AppetizerCell(appetizer: appetizer)
                    .onTapGesture {
                        model.selectedAppetizer = appetizer
                    }
            }
            .navigationBarHidden(model.selectedAppetizer != nil)
            .navigationTitle("🍟 Appetizer")
            
            if model.selectedAppetizer != nil {
                AppetizerDetailView()
            }
            
            if model.appetizers.isEmpty {
                ProgressView()
                    .scaleEffect(2)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
            }
        }
        .alert(item: $model.alert) { Alert(from: $0) }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppetizerListView()
                .environmentObject(AppertizyModel())
        }
    }
}
