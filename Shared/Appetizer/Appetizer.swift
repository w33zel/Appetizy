//
//  Appetizer.swift
//  Appetizy
//
//  Created by Christian Arlt on 13.11.20.
//

import Foundation

struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct Appetizer: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: URL
    let calories: Int
    let protein: Int
    let carbs: Int
}

// Mock Data
extension Appetizer {
    static let all = [testAppetizer, testAppetizer, testAppetizer, testAppetizer, testAppetizer, testAppetizer, testAppetizer]
    static let testAppetizer = Appetizer(id: 1,
                                         name: "Yummy meat",
                                         description: "This is a test Appetizer named \"Yummy meat\" and its much yummy.",
                                         price: 1.5,
                                         imageURL: URL(string: "asian-flank-steak")!,
                                         calories: 100,
                                         protein: 9,
                                         carbs: 9)
}
