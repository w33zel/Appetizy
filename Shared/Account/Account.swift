//
//  Account.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 22.11.20.
//

import Foundation

struct Account: Codable {
    var firstname: String = ""
    var lastname: String = ""
    var email: String = ""
    var birthdate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = false
    
    var isValid: Bool {
        guard isValidForm && isValidEmail && isFullAged else { return false }
        return true
    }
    
    var isValidForm: Bool {
        guard !firstname.isEmpty && !lastname.isEmpty && !email.isEmpty else { return false }
        return true
    }
    
    var isValidEmail: Bool {
        guard email.isValidEmail else { return false }
        return true
    }
    
    var isFullAged: Bool {
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year], from: birthdate, to: Date())
        
        guard let years = components.year, years > 18 else { return false }
        return true
    }
}
