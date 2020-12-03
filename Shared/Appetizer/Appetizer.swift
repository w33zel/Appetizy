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

struct Appetizer: Codable, Identifiable, Hashable {
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
struct MockData {
    static var all: [Appetizer] {
        var appitizers: [Appetizer] = []
        let names = ["Yummy meat", "Yummy yummy meat", "Verry yummy yummy meat", "Really verry yummy yummy meat"]
        
        for index in 1 ..< 20 {
            appitizers.append(.init(id: index,
                                    name: names.randomElement()!,
                                    description: "This is a test Appetizer named \"Yummy meat\" and its much yummy.",
                                    price: 1.5,
                                    imageURL: URL(string: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg")!,
                                    calories: 100,
                                    protein: 9,
                                    carbs: 9))
        }
        
        return appitizers
    }
    static let testAppetizer = Appetizer(id: 1,
                                         name: "Yummy meat",
                                         description: "This is a test Appetizer named \"Yummy meat\" and its much yummy.",
                                         price: 1.5,
                                         imageURL: URL(string: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg")!,
                                         calories: 100,
                                         protein: 9,
                                         carbs: 9)
}
