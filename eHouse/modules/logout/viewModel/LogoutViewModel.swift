//
//  LogoutViewModel.swift
//  eHouse
//
//  Created by David Deschamps on 10/08/2021.
//

import Foundation

class LogoutViewModel: ObservableObject {
    
    @Published var logoutSuccessful = false
    @Published var errorMessage =  ""
    @Published var errorOccured = false
    
    private let authService = AuthService()
    
    func logout() {
        authService.logout { err in
            if err == nil {
                self.logoutSuccessful = true
            } else {
                self.errorOccured = true
                self.errorMessage = err!.localizedDescription
            }
        }
    }
}
