//
//  UserCellRow.swift
//  eHouse
//
//  Created by David Deschamps on 07/08/2021.
//

import SwiftUI

struct UserCellRow: View {
    
    let userName: String
    let userTYpe: String
    let userAvatar: String
    
    var body: some View {
        HStack {
            Image(userAvatar)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2) {
                Text(userName)
                    .fontWeight(.semibold)
                    .foregroundColor(.title)
                Text(userTYpe)
                    .foregroundColor(.text)
                    .font(.caption)
            }
            .padding(.leading, 8)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

struct UserCellRow_Previews: PreviewProvider {
    static var previews: some View {
        UserCellRow(userName: "Susie Jenkins",
                    userTYpe: "Roommate",
                    userAvatar: K.RoomatesAvatar.susie)
    }
}
