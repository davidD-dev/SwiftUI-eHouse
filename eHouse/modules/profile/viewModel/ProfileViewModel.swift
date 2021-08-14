//
//  ProfileViewModel.swift
//  eHouse
//
//  Created by David Deschamps on 12/08/2021.
//

import SwiftUI
import Foundation

class ProfileViewModel: ObservableObject {
    
    private var authService = AuthService()
    private var userService = UserService()
    
    @Published var errorOccured = false
    @Published var errorMessage = ""
    @Published var updatePictureSuccessful = false
    
        
    func saveImage(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 1) else {
            print("No DATA IMAGE")
            return
        }
        
        let str = data.base64EncodedString()
        
        if let currentUser = authService.getCurrentUser() {
            
            userService.updateUserPicture(for: currentUser, with: str ) { userId, err in
                if err != nil {
                    self.errorOccured = true
                    self.errorMessage = err!.localizedDescription
                } else {
                    if let id = userId {
                        DispatchQueue.main.async {
                            self.authService.saveUser(userId: id) { error in
                                if error == nil {
                                    self.updatePictureSuccessful = true
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    func getProfilePicture() -> UIImage? {
        if let currentUser = authService.getCurrentUser() {
            if let dataImageString = currentUser.profilePicture {
                if let dataImage = Data(base64Encoded: dataImageString) {
                    let profileImage = UIImage(data: dataImage)
                    return profileImage
                }
            }
        }
        return nil
    }
}
