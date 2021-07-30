//
//  OnboardingView.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import SwiftUI

struct OnboardingView: View {
    
    var onboardingData: [OnboardingItem] = [
        OnboardingItem(imageName: K.OnbImages.findPlace, title: "Find PLaces to lives", description: "Find great verified places & people to share the home with."),
        OnboardingItem(imageName: K.OnbImages.match, title: "Match Your Preferences", description: "Tell us your preferences and match with the right people."),
        OnboardingItem(imageName: K.OnbImages.like, title: "Like minded", description: "Live together with people who will inspire like you.")
    ]
    var body: some View {
        VStack {
            TabView {
                ForEach(0 ..< onboardingData.count) { index in
                    let item = onboardingData[index]
                    OnboardingItemView(item: item)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Button(action: {}, label: {
                Text("GET STARTED")
                    .bold()
                    .textStyle(GradientButtonStyle())
            })
            
            Button(action: {}, label: {
                Text("Login")
                    .padding()
                    .foregroundColor(.text)
            })
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

