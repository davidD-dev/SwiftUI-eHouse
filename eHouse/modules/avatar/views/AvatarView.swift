//
//  AvatarView.swift
//  eHouse
//
//  Created by David Deschamps on 10/08/2021.
//

import SwiftUI

struct AvatarView: View {
    
    @StateObject private var avatarViewModel = AvatarViewModel()

    var size : CGFloat
    
    init(size: CGFloat = 50) {
        self.size = size
    }
    
    var body: some View {
        VStack {
            if let userAvatar = avatarViewModel.userAvatar {
                Image(uiImage: userAvatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            }
        }
        .onAppear {
            avatarViewModel.getProfilePicture()
        }

        
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
