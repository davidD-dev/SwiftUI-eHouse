//
//  PassworrdResetViewModel.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import Foundation

class PasswordResetViewModel: ObservableObject {
    @Published var email = ""
    @Published var showingAlert = false
    
    private let authService = AuthService()
    
    func sendPasswordReset() {
        authService.sendPasswordReset(email: email) {
            self.showingAlert = true
        }
        
    }
}
