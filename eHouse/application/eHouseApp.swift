//
//  eHouseApp.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import SwiftUI
import Firebase

@main
struct eHouseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
