//
//  AppetizyModel.swift
//  Appetizy
//
//  Created by Christian Arlt on 13.11.20.
//

import Foundation

final class AppertizyModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var selectedAppetizer: Appetizer?
    @Published var alert: AlertItem?
    @Published var isLoading = false
    
    
    init() {
        loadAppetizer()
    }
    
    func clearSelectedAppetizer() {
        selectedAppetizer = nil
    }
    
    func loadAppetizer() {
        isLoading = true
        NetworkManager.shared.getAppitizers { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .debugError(let error, let checking):
                        alert = AlertContext.debugError(with: error, checking: checking)
                    case .networkFailure(let error):
                        alert = AlertContext.networkFailure(with: error)
                    case .invalidData:
                        alert = AlertContext.invalidData
                    case .invalidURL:
                        alert = AlertContext.invalidURL
                    case .invalidResponse:
                        alert = AlertContext.invalidResponse
                    case .unableToComplete:
                        alert = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
