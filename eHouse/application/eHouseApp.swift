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
            if UserDefaults.standard.bool(forKey: K.UserFlags.LOGGED_IN) {
                HomeView()
            } else if UserDefaults.standard.bool(forKey: K.UserFlags.ONBOARDED) {
                LoginView()
            } else  {
                OnboardingView()
            }
        }
    }
}
