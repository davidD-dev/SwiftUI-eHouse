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
    
    var body: some View {
        NavigationView {
            VStack {
                ScreenTitle("Hi, \nWelcome back !")
                VStack(spacing: 16) {
                    EmailField(email: $userEmail)
                        .padding(.horizontal, 20)
                    HStack {
                        Image(systemName: "key")
                            .foregroundColor(.text.opacity(0.7))
                        SecureField("Password", text: $password)
                    }
                    .font(.title3)
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.text.opacity(0.7), lineWidth: 1))
                    .padding(.horizontal, 20)
                    
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
                    
                }
                
                Button(action: {}, label: {
                    Text("LOGIN")
                        .bold()
                        .textStyle(GradientButtonStyle())
                })
                Spacer()
                HStack {
                    Text("Don't have eHome account ?")
                        .foregroundColor(.title)
                    NavigationLink(
                        destination: RegisterTypeView()) {
                        Text("Sign Up")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



