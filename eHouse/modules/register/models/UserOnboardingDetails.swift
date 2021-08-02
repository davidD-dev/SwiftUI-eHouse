//
//  UserOnboardingDetails.swift
//  eHouse
//
//  Created by David Deschamps on 02/08/2021.
//

import Foundation

class UserOnboardingDetails: ObservableObject {
    @Published var roomType = ""
    @Published var location = ""
    @Published var moveInDate = Date()
    @Published var maxRent: Double = 2500
    
}
