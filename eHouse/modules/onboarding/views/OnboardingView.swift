//
//  OnboardingView.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var showLogin = false
    @State private var animateLogin = false
    @State private var animate = false
    
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
            .offset(x: animate ? 0 : 400)
            
            Button(action: {  }, label: {
                Text("GET STARTED")
                    .bold()
                    .textStyle(GradientButtonStyle())
            })
            .offset(x: animate ? 0 : -400)
            .padding(.top, 25)
            .padding(.bottom, 20)
            
            Button(action: { showLogin.toggle() }, label: {
                Text("Login")
                    .padding()
                    .foregroundColor(.text)
                    .opacity(animateLogin ? 1 : 0)
            })
        }
        .onAppear {
           animateView()
        }
        .fullScreenCover(isPresented: $showLogin) {
            LoginView()
        }
    }
    
    //MARK:- utils

    func animateView() {
        DispatchQueue.main.async {
            withAnimation(.linear(duration: 2)) {
                animateLogin.toggle()
            }
            
            withAnimation(Animation.interpolatingSpring(stiffness: 40, damping: 8)) {
                animate.toggle()
            }
        }
 
    }
}



//MARK:- Preview

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

