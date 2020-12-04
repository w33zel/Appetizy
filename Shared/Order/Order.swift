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
        appetizers.reduce(0.0, {$0 + $1.price})
    }
}
