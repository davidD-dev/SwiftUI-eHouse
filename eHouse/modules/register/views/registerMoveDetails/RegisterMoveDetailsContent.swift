//
//  RegisterMoveDetailsContent.swift
//  eHouse
//
//  Created by David Deschamps on 03/08/2021.
//

import SwiftUI

struct RegisterMoveDetailsContent: View {
    @EnvironmentObject var onboardingDetails: UserOnboardingDetails
    
    var body: some View {
        VStack(alignment: .leading) {
            ScreenTitle("What is your maximum rent ?")
            
            HStack(alignment: .bottom) {
                Text(String(format: "%.0f€", onboardingDetails.maxRent))
                    .foregroundColor(.blue)
                    .bold()
                    .font(.title)
                Text("per month")
                    .padding(.bottom, 6)
            }
            .padding(.leading, 20)
            
            VStack {
                Slider(value: $onboardingDetails.maxRent, in: 0...5000, step: 100)
                HStack {
                    Text("0€")
                        .foregroundColor(.text)
                    Spacer()
                    Text("5000€")
                        .foregroundColor(.text)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            
            ScreenTitle("When is your mon-in date ?")
            DatePicker(selection: $onboardingDetails.moveInDate, displayedComponents: .date) {
                Text("Move-in date")
                    .foregroundColor(.text)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct RegisterMoveDetailsContent_Previews: PreviewProvider {
    static var previews: some View {
        RegisterMoveDetailsContent()
    }
}
