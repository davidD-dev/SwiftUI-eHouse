//
//  OnboardingItem.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import Foundation

struct OnboardingItem {
    let imageName: String
    let title: String
    let description: String
    
    static let example: OnboardingItem = OnboardingItem(imageName: K.OnbImages.findPlace, title: "Find PLaces to lives", description: "Find great verified places & people to share the home with.")
}
