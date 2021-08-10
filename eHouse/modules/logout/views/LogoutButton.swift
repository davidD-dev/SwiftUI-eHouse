//
//  LogoutButton.swift
//  eHouse
//
//  Created by David Deschamps on 10/08/2021.
//

import SwiftUI

struct LogoutButton: View {
    
    @ObservedObject private var logoutViewModel = LogoutViewModel()
    
    var body: some View {
        ZStack {
            Button(action: { onClick() }, label: {
                Text("Logout")
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            })
            .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(lineWidth: 1)
                        )
            .foregroundColor(.white)
            
            .alert(isPresented: $logoutViewModel.errorOccured, content: {
                Alert(title: Text("Error !"), message: Text(logoutViewModel.errorMessage))
            })
        }
        .fullScreenCover(isPresented: $logoutViewModel.logoutSuccessful) {
            LoginView()
        }
    }
    
    fileprivate func onClick() {
        logoutViewModel.logout()
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
            .preferredColorScheme(.dark)
    }
}
