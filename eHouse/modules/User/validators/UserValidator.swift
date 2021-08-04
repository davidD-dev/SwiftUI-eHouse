//
//  UserValidator.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import Foundation

struct UserValidator {
    
    var fieldMissing = ""
    
    mutating func isValid(user: User) -> Bool {
        
        guard !user.email.isEmpty else {
            fieldMissing = "email"
            return false
            
        }
        guard !user.fullName.isEmpty else {
            fieldMissing = "full name"
            return false
        }
        guard !user.phoneNumber.isEmpty else {
            fieldMissing = "phone number"
            return false
            
        }
        guard !user.password.isEmpty else {
            fieldMissing = "password"
            return false
        }
        guard !user.confirmPassword.isEmpty else {
            fieldMissing = "confirm password"
            return false
            
        }

        return true
    }
    
    func getFieldIncorrect() -> String {
        return fieldMissing
    }
}
