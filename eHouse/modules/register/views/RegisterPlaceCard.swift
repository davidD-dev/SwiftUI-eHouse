//
//  RegisterPlaceCard.swift
//  eHouse
//
//  Created by David Deschamps on 02/08/2021.
//

import SwiftUI

struct RegisterPlaceCard: View {
    
    @EnvironmentObject var onboardingDetails: UserOnboardingDetails
    @State private var readyToNavigate = false
    
    let image: String
    let city: String
    let country: String
    
    var body: some View {
        
        NavigationLink(
            destination: RegisterMoveDetailsView(), isActive: $readyToNavigate) {
            Button(action: onClick) {
                VStack(alignment: .leading) {
                    Image(image)
                    Text(city)
                        .foregroundColor(.title)
                        .bold()
                    Text(country)
                        .font(.system(size: 14))
                        .foregroundColor(.text)
                }
            }
        }
    }
    
    //MARK:- Methods
    
    private func onClick() {
        onboardingDetails.location = city
        readyToNavigate = true
    }
}



//MARK:- Preview
struct RegisterPlaceCard_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlaceCard(image: K.CitiesImages.boston, city: "Boston", country: "USA")
    }
}
