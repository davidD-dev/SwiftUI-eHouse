//
//  User.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import Foundation

class User {
    var fullName : String
    let phoneNumber : String
    let gender : String
    let moreInfo : String
    let email : String
    let password : String
    let confirmPassword : String
    
    init(email: String,
         phoneNumber: String,
         gender: String,
         password: String,
         //pas sur qu'on ai besoin de confirmPassword
         confirmPassword: String,
         fullName : String,
         moreInfo: String) {
        
        self.email = email
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.gender = gender
        self.moreInfo = moreInfo
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
