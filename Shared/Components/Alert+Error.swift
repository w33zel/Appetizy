//
//  Alert+Error.swift
//  Appetizy
//
//  Created by Christian Arlt on 13.11.20.
//

import SwiftUI

enum NetworkError: Error {
    case debugError(Error, String)
    case networkFailure(Error)
    case invalidData
    case invalidURL
    case invalidResponse
    case unableToComplete
}

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static func debugError(with error: Error, checking: String) -> AlertItem {
        let errorString: String = "\(error)"
        return AlertItem(title: Text(checking), message: Text(errorString), dismissButton: .default(Text("OK")))
    }
    
    static func networkFailure(with error: Error) -> AlertItem {
        AlertItem(title: Text("Problem with network"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
    }
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Data received from the server was invalide. Please contact support."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("Unable to reach server. Please try again later or contact support."),
                                      dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalide response from server. Please try again later or contact support."),
                                           dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                             message: Text("Unable to complete your request yet, try again later."),
                                             dismissButton: .default(Text("OK")))
}

extension Alert {
    init(from alertItem: AlertItem) {
        self.init(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
    }
}
