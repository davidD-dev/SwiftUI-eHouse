//
//  RegisterViewModel.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var phoneNumber = ""
    @Published var selectedGender = 0
    @Published var moreAboutYou = ""
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var errorOccured = false
    @Published var errorMessage = ""
    
    
    @Published var registerSuccessful = false
    
    @Published var loading = false
    
    
    let genders = ["Male", "Female", "Cactus"]
    
    private var userValidator = UserValidator()
    
    func register() {
        let user = User(email: email,
                        phoneNumber: phoneNumber,
                        gender: genders[selectedGender],
                        password: password,
                        confirmPassword: confirmPassword,
                        fullName: fullName,
                        moreInfo: moreAboutYou)
        
        if !userValidator.isValid(user: user) {
            errorOccured = true
            errorMessage = "The \(userValidator.getFieldIncorrect()) field is empty, please check."
            return
        }
        loading = true
//        registerSuccessful = true
        
    }
}
