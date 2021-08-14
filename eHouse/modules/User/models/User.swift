//
//  User.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import SwiftUI
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
    var profilePicture : String? = UIImage(named: K.RoomatesAvatar.max)?.jpegData(compressionQuality: 1)?.base64EncodedString()
    
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
    
    func changeProfilePicture(with data: String) {
        profilePicture = data
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
             maxRent,
             profilePicture
    }
}
