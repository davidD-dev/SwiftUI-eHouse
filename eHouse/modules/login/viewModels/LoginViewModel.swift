//
//  LoginViewModel.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var loginSuccessful = false
    
    private let authService = AuthService()
    
    func loginUser() {
        authService.loginUser(withEmail: email, andPassword: password) { error in
            self.loginSuccessful = true
        }
    }
}
