//
//  User.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import Foundation
import FirebaseFirestoreSwift

class User : Identifiable, Codable {
    
    @DocumentID var id : String?
    
    var userId = ""
    var fullName : String
    let phoneNumber : String
    let gender : String
    let moreInfo : String
    let email : String
    var password : String = ""
    var confirmPassword : String = ""
    
    //onboarding details
    var roomType = ""
    var location = ""
    var moveInDate = Date()
    var maxRent : Double = 0
    
    init(email: String,
         phoneNumber: String,
         gender: String,
         password: String,
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
    
    func set(onboardingDetails: UserOnboardingDetails) {
        roomType = onboardingDetails.roomType
        location = onboardingDetails.location
        moveInDate = onboardingDetails.moveInDate
        maxRent = onboardingDetails.maxRent
    }
    
    private enum CodingKeys: String, CodingKey {
        case userId,
             email,
             fullName,
             gender,
             phoneNumber,
             moreInfo,
             roomType,
             location,
             moveInDate,
             maxRent
    }
}
