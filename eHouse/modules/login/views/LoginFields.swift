//
//  LoginFields.swift
//  eHouse
//
//  Created by David Deschamps on 01/08/2021.
//

import SwiftUI

struct LoginFields: View {
    @Binding var email: String
    @Binding var password: String
    
    @State private var animateLogin = false
    @State private var animateEmail = false
    @State private var animatePassword = false
    
    let xOffset : CGFloat =  -200

    
    let animationDuration = 0.3
    let animationDelay = 0.3
    
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                EmailField(email: $email)
                    .padding(.horizontal, 20)
                    .offset(x: animateEmail ? 0 : xOffset)
                    .opacity(animateEmail ? 1 : 0)
                
                PasswordField(password: $password)
                    .padding(.horizontal, 20)
                    .offset(x: animatePassword ? 0 : xOffset)
                    .opacity(animatePassword ? 1 : 0)
                
            }

            
            HStack {
                Spacer()
                NavigationLink(
                    destination: PasswordRsetView()) {
                    Text("Forgot password ?")
                        .foregroundColor(.text)
                }
                .padding(.top, 10)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .opacity(animateLogin ? 1 : 0)
                
            }
        }
        .onAppear {
            animateViews()
        }
    }
    
    //MARK:- Utils
    
    private func animateViews() {
        DispatchQueue.main.async {
            withAnimation(.easeOut(duration: animationDuration).delay(animationDelay + 0.2)) {
                animateEmail = true
            }
            withAnimation(.easeOut(duration: animationDuration).delay(animationDelay + 0.4)) {
                animatePassword = true
            }
            withAnimation(.easeIn(duration: animationDuration).delay(animationDelay + 0.6)) {
                animateLogin = true
            }
        }
    }
}

//MARK:- Preview
struct LoginFields_Previews: PreviewProvider {
    static var previews: some View {
        LoginFields(email: .constant(""), password: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
