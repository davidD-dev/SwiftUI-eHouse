//
//  RegisterPlaceView.swift
//  eHouse
//
//  Created by David Deschamps on 02/08/2021.
//

import SwiftUI

struct RegisterPlaceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var onboardingDetails : UserOnboardingDetails
    
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            ScreenTitle("Where are you going ?")
            LazyVGrid(columns: gridColumns, alignment: .center, spacing: 20) {
                
                RegisterPlaceCard(image: K.CitiesImages.boston, city: "Boston", country: "USA")
                
                RegisterPlaceCard(image: K.CitiesImages.london, city: "London", country: "UK")
                
                RegisterPlaceCard(image: K.CitiesImages.newYork, city: "New York", country: "USA")
                
                RegisterPlaceCard(image: K.CitiesImages.paris, city: "Paris", country: "France")
            }
        }
        .navigationTitle("Step 2-4")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(onClick: onClick, text: "Step 1-4"))
    }
    
    fileprivate func onClick() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct RegisterPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlaceView()
            .environmentObject(UserOnboardingDetails())
    }
}
