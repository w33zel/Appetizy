//
//  Order.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 29.11.20.
//

import Foundation

struct Order {
    var appetizers: [Appetizer] = []
    var finalPrice: Double {
        get {
            var price = 0.0
            appetizers.forEach { price += $0.price }
            return price
        }
    }
}
