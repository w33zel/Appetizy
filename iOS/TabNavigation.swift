//
//  TapNavigation.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 13.11.20.
//

import SwiftUI

struct TabNavigation: View {
    @State private var selection: Tab = .appetizer
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                AppetizerListView()
            }
            .tabItem { Image(systemName: "house") }
            .tag(Tab.appetizer)
            
            NavigationView {
                AccountView()
            }
            .tabItem { Image(systemName: "person") }
            .tag(Tab.account)
            
            NavigationView {
                OrderView()
            }
            .tabItem { Image(systemName: "bag") }
            .tag(Tab.order)
        }
    }
}

extension TabNavigation {
    enum Tab {
        case appetizer
        case account
        case order
    }
}

struct TapNavigation_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigation()
    }
}
