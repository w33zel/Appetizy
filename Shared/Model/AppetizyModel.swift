//
//  AppetizyModel.swift
//  Appetizy
//
//  Created by Christian Arlt on 13.11.20.
//

import SwiftUI

final class AppertizyModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var alert: AlertItem?
    
    // Appetizer
    @Published var appetizers: [Appetizer] = []
    @Published var selectedAppetizer: Appetizer?

    // Account
    @Published var account = Account()
    
    // Order
    @Published var order = Order()
    
    
    init() {
        print(">>> init Model")
        loadUser()
        loadAppetizers()
    }
    
    func removeOrder(indexSet: IndexSet) {
        order.appetizers.remove(atOffsets: indexSet)
    }
    
    func addOrder() {
        guard let appetizer = selectedAppetizer else { return }
        
        if order.appetizers.contains(appetizer) {
            // alert already in orders
            return
        }
        order.appetizers.append(appetizer)
    }
    
    func saveAccount() {
        guard account.isValid else { return }
        
        do {
            let data = try JSONEncoder().encode(account)
            userData = data
            alert = AlertContext.saveSuccess
        } catch {
            alert = AlertContext.saveFailure
        }
    }
    
    func loadUser() {
        guard let data = userData else { return }
        guard let account = try? JSONDecoder().decode(Account.self, from: data) else { return }
        self.account = account
    }
    
    func validateForm() {
        if !account.isValidEmail { alert = AlertContext.invalideEmail }
        if !account.isFullAged { alert = AlertContext.underAged }
        if !account.isValidForm { alert = AlertContext.invalideForm }
    }
    
    func clearSelectedAppetizer() {
        print(">>> clearSelectedAppetizer")

        selectedAppetizer = nil
    }
    
    func loadAppetizers() {
        print(">>> loadAppetizers")

        NetworkManager.shared.getAppitizers { [self] result in
            DispatchQueue.main.async {
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
