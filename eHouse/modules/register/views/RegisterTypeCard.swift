//
//  RegisterTypeCard.swift
//  eHouse
//
//  Created by David Deschamps on 02/08/2021.
//

import SwiftUI

struct RegisterTypeCard: View {
    let gradientStartColor: Color
    let gradientEndColor: Color
    let image: String
    let cardText: String
    
    @EnvironmentObject var onboardingDetails: UserOnboardingDetails
    @State private var readyToNavigate = false
    
    var backgroundColor: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [gradientStartColor, gradientEndColor]), startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        NavigationLink(destination: RegisterPlaceView().environmentObject(onboardingDetails), isActive: $readyToNavigate) {
            Button(action: onClick) {
                ZStack {
                    Rectangle()
                        .fill(backgroundColor)
                        .frame(width: 150, height: 150)
                        .cornerRadius(6)
                    Image(image)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .offset(y: -20)
                    Text(cardText)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .offset(y: 35)
                }
                .shadow(radius: 8)
            }
        }
    }
    
    //MARK:- utils
    
    private func onClick() {
        onboardingDetails.roomType = cardText
        readyToNavigate = true
    }
}

//MARK:- Preview

struct RegisterTypeCard_Previews: PreviewProvider {
    static var previews: some View {
        RegisterTypeCard(gradientStartColor: .roomStart, gradientEndColor: .roomEnd, image: "ic_room", cardText: "Room")
            .previewLayout(.sizeThatFits)
            .environmentObject(UserOnboardingDetails())
    }
}
