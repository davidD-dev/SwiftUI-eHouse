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
    @State private var showRgister = false
    
    var onboardingData: [OnboardingItem] = [
        OnboardingItem(imageName: K.OnbImages.findPlace, title: "Find Places to lives", description: "Find great verified places & people to share the home with."),
        OnboardingItem(imageName: K.OnbImages.match, title: "Match Your Preferences", description: "Tell us your preferences and match with the right people."),
        OnboardingItem(imageName: K.OnbImages.like, title: "Like minded", description: "Live together with people who will inspire like you.")
    ]
    
    var body: some View {
        NavigationView {
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
                

                
                NavigationLink(
                    destination: RegisterTypeView()
                    .environmentObject(UserOnboardingDetails()),
                    isActive: $showRgister) {
                    
                    Button(action: getStartedOnClick, label: {
                        Text("GET STARTED")
                            .bold()
                            .textStyle(GradientButtonStyle())
                    })
                    .offset(x: animate ? 0 : -400)
                    .padding(.top, 25)
                    .padding(.bottom, 20)
                }
                
                
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
            .sheet(isPresented: $showLogin) {
                LoginView()
            }

        }
    }
    
    //MARK:- utils

    fileprivate func animateView() {
        DispatchQueue.main.async {
            withAnimation(.linear(duration: 2)) {
                animateLogin = true
            }
            
            withAnimation(Animation.interpolatingSpring(stiffness: 40, damping: 8)) {
                animate = true
            }
        }
    }
    
    fileprivate func getStartedOnClick() {
        showRgister = true
    }
}



//MARK:- Preview

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

