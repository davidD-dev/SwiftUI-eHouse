//
//  AvatarViewModel.swift
//  eHouse
//
//  Created by David Deschamps on 14/08/2021.
//

import SwiftUI


class AvatarViewModel: ObservableObject {
    
    private var authService = AuthService()
    
    @Published var userAvatar : UIImage?
    
    func getProfilePicture() {
        if let currentUser = authService.getCurrentUser() {
            if let dataImageString = currentUser.profilePicture {
                if let dataImage = Data(base64Encoded: dataImageString) {
                    let profileImage = UIImage(data: dataImage)
                    DispatchQueue.main.async {
                        self.userAvatar =  profileImage
                    }
                    
                }
            }
        }
    }
}
