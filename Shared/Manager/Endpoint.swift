//
//  Endpoint.swift
//  Appetizy
//
//  Created by Christian Arlt on 13.11.20.
//

import Foundation

struct Endpoint {
    private let path: String
}

extension Endpoint {
    static var appetizer: Self {
        Endpoint(path: "/swiftui-fundamentals/appetizers")
    }
}
extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "seanallen-course-backend.herokuapp.com"
        components.path = path
        
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }
        return url
    }
}
