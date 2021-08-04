//
//  LoginView.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import SwiftUI

struct LoginView: View {    
    @State private var userEmail: String = ""
    @State private var password: String = ""
    
    @State private var animateLogin = false
    
    let animationDuration = 0.3
    let animationDelay = 0.9
    
    var body: some View {
        NavigationView {
            VStack {
                ScreenTitle("Hi, \nWelcome back !")
                LoginFields(email: $userEmail, password: $password)
                
                Button(action: {}, label: {
                    Text("LOGIN")
                        .bold()
                        .textStyle(GradientButtonStyle())
                })
                .opacity(animateLogin ? 1 : 0)
                .offset(x: animateLogin ? 0 : -200)
                
                
                Spacer()
                HStack {
                    Text("Don't have eHome account ?")
                        .foregroundColor(.title)
                    NavigationLink(
                        destination: RegisterTypeView()
                            // Créé un environement object de type
                            // UserOnboardingDetails pour stocker
                            // les datas tout le long du process
                            .environmentObject(UserOnboardingDetails())) {
                        Text("Sign Up")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 30)
                .opacity(animateLogin ? 1 : 0)
            }
            .onAppear {
                animateViews()
            }
        }
    }
    
    //MARK:- Utils
    
    private func animateViews() {
        DispatchQueue.main.async {
            withAnimation(.easeIn(duration: animationDuration).delay(animationDelay)) {
                animateLogin = true
            }
        }
    }
}



//MARK:- Preview

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserOnboardingDetails())
    }
}





