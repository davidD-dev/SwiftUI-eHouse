//
//  LoginView.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var userEmail: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            ScreenTitle("Hi, \nWelcome back !")
            VStack {
                TextField("Email address", text: $userEmail)
                    .font(.title3)
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.text.opacity(0.7), lineWidth: 1))
                    .padding(.horizontal, 20)
                
                SecureField("Password", text: $password)
                    .font(.title3)
                    .padding(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.text.opacity(0.7), lineWidth: 1))
                    .padding(.horizontal, 20)
                
            }
            
            Button(action: {}, label: {
                Text("LOGIN")
                    .bold()
                    .textStyle(GradientButtonStyle())
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

