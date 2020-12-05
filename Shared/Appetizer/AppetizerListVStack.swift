//
//  AppetizerListVStack.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 29.11.20.
//

import SwiftUI

struct AppetizerListVStack: View {
    @EnvironmentObject var model: AppertizyModel

    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: .zero) {
                    ForEach(model.appetizers) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                                .padding()
                                .onTapGesture { model.selectedAppetizer = appetizer }
                        
                    }
                }
            }
            
            if model.selectedAppetizer != nil {
                AppetizerDetailView()
            }
            
            if model.appetizers.isEmpty {
                ProgressView()
                    .scaleEffect(2)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.accentColor))
            }
        }
        .navigationTitle(model.selectedAppetizer != nil ? "" : "🍟 Appetizer")
        .onTapGesture { model.clearSelectedAppetizer() }
    }
}

struct AppetizerListVStack_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppetizerListVStack()
                .navigationTitle("🍟 Appetizer")
                .environmentObject(AppertizyModel())
        }
    }
}
