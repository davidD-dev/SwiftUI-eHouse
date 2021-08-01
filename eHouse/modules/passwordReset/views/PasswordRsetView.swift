//
//  PasswordRsetView.swift
//  eHouse
//
//  Created by David Deschamps on 01/08/2021.
//

import SwiftUI

struct PasswordRsetView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    var body: some View {
        ZStack {
            AnimatedWaveBackground()
            
            VStack(alignment: .leading) {
                ScreenTitle("Forgot password ?")
                Text("PLease enter your email below to receive your password reset instructions.")
                    .foregroundColor(.text)
                    .padding(.horizontal, 20)
                EmailField(email: $email)
                    .padding(20)
                Button(action: { showAlert.toggle() }){
                    Text("SEND REQUEST")
                        .bold()
                        .textStyle(GradientButtonStyle())
                        
                }
                Spacer()
                
            }
            .alert(isPresented: $showAlert) {
                displayAlert()
        }
        }
    }
    
    //MARK:- Utils
    
    private func displayAlert() -> Alert {
        Alert(title: Text("Success"), message: Text("An email with the instructions has been sent to your email."), dismissButton: .default(Text("Go it!"), action: {
            presentationMode.wrappedValue.dismiss()
        }))
    }
}

//MARK:- Preview

struct PasswordRsetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordRsetView()
    }
}
