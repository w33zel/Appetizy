//
//  Account.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 22.11.20.
//

import Foundation

struct Account {
    var firstname: String
    var lastname: String
    var email: String
    var birthdate: Date
    var extraNapkins: Bool
    var frequentRefills: Bool
    
    init(firstname: String = "",
         lastname: String = "",
         email: String = "",
         birthdate: Date = Date(),
         extraNapkins: Bool = false,
         frequentRefills: Bool = false) {
        
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.birthdate = birthdate
        self.extraNapkins = extraNapkins
        self.frequentRefills = frequentRefills
    }
}
