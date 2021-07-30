//
//  OnboardingItemView.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import SwiftUI

struct OnboardingItemView: View {
    
    var onboardingItem: OnboardingItem
    
    init(item: OnboardingItem) {
        onboardingItem = item
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(onboardingItem.imageName)
                    .resizable()
                    .frame(height: geometry.size.height / 1.5)
                    .frame(maxWidth: .infinity)
                Text(onboardingItem.title)
                    .font(.title)
                    .foregroundColor(.title)
                    .bold()
                    .padding()
                Text(onboardingItem.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.text)
                    .padding(.horizontal, 15)
            }
        }
    }
}

struct OnboardingItemView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingItemView(item: OnboardingItem.example)
    }
}
