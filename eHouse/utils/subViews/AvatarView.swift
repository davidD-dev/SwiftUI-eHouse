//
//  AvatarView.swift
//  eHouse
//
//  Created by David Deschamps on 10/08/2021.
//

import SwiftUI

struct AvatarView: View {
    
    var userAvatar : String = K.RoomatesAvatar.nyle
    var size : CGFloat = 50
    
    var body: some View {
        Image(userAvatar)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
