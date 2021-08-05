//
//  RegisterProfileView.swift
//  eHouse
//
//  Created by David Deschamps on 02/08/2021.
//

import SwiftUI

struct RegisterProfileView: View {
    
    @StateObject private var registerViewModel = RegisterViewModel()
    
    @State var testPick = 0
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    fullNameField()
                    
                    phoneNumberField()
                    
                    
                    genderPickerField()
                    
                    emailAndPasswordPart()
                    
                    
                    moreAboutYoutField()
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: HomeView(), isActive: $registerViewModel.registerSuccessful) {
                        Button(action: registerViewModel.register) {
                            Text("REGISTER")
                                .bold()
                                .textStyle(GradientButtonStyle())
                        }
                    }
                }
                .padding()
                .alert(isPresented: $registerViewModel.errorOccured) {
                    Alert(title: Text("Error"), message: Text(registerViewModel.errorMessage))
                }
                
            }
            .navigationTitle("Complete your profile")
            if registerViewModel.loading {
                LoadingView()
                    .navigationBarHidden(true)
            }
        }
    }
    
    //MARK:- Methods
    
    fileprivate func fullNameField() -> some View {
        return TextField("Full Name", text: $registerViewModel.fullName)
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    fileprivate func phoneNumberField() -> some View {
        return TextField("Phone Number", text: $registerViewModel.phoneNumber)
            .disableAutocorrection(true)
            .keyboardType(.namePhonePad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    fileprivate func genderPickerField() -> some View {
        return VStack(alignment: .leading) {
            Text("Gender")
                .foregroundColor(.text)
            
            Picker(selection: $registerViewModel.selectedGender, label: Text("Gender")) {
                ForEach(0 ..< registerViewModel.genders.count) { index in
                    Text(registerViewModel.genders[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .cornerRadius(8)
        }
    }
    
    fileprivate func emailAndPasswordPart() -> some View {
        return VStack(alignment: .leading) {
            Text("Enter your email address")
                .foregroundColor(.text)
                .padding(.bottom, 4)
            EmailField(email: $registerViewModel.email)
            
            Text("Enter your password")
                .foregroundColor(.text)
                .padding(.bottom, 4)
                .padding(.top, 8)
            PasswordField(password: $registerViewModel.password)
            
            Text("Confirm your password")
                .foregroundColor(.text)
                .padding(.bottom, 4)
                .padding(.top, 8)
            PasswordField(password: $registerViewModel.confirmPassword, placeHolder: "Confirm Password")
        }
        .padding(.vertical, 6)
    }
    
    fileprivate func moreAboutYoutField() -> some View {
        return VStack(alignment: .leading) {
            Text("Tell us more about you")
                .foregroundColor(.text)
            TextEditor(text: $registerViewModel.moreAboutYou)
                .frame(height: 100, alignment: .topLeading)
                .padding(8)
                .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1))
        }
    }
}

struct RegisterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterProfileView()
    }
}
