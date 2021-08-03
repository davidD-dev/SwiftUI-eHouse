//
//  RegisterProfileView.swift
//  eHouse
//
//  Created by David Deschamps on 02/08/2021.
//

import SwiftUI

struct RegisterProfileView: View {
    
    @State var fullName = ""
    @State var phoneNumber = ""
    @State var selectedGender = 0
    @State var moreAboutYou = ""
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State var registerButtonTap = false
    
    let genders = ["Male", "Female", "Cactus"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                fullNameField()
                
                phoneNumberField()

                
                genderPickerField()
                
                emailAndPasswordPart()

                
                moreAboutYoutField()
                
                Spacer()
                
                NavigationLink(
                    destination: HomeView()) {
                    Button(action: onClick) {
                        Text("REGISTER")
                            .bold()
                            .textStyle(GradientButtonStyle())
                    }
                }
            }
            .padding()
            .onTapGesture {
                hideKeyboard()
            }
            
        }
        .navigationTitle("Complete your profile")
    }
    
    //MARK:- Methods
    
    fileprivate func onClick() {
        registerButtonTap = true
    }
    
    fileprivate func fullNameField() -> some View {
        return TextField("Full Name", text: $fullName)
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    fileprivate func phoneNumberField() -> some View {
        return TextField("Phone Number", text: $phoneNumber)
            .disableAutocorrection(true)
            .keyboardType(.phonePad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    fileprivate func genderPickerField() -> some View {
        return VStack(alignment: .leading) {
            Text("Gender")
                .foregroundColor(.text)
            
            Picker(selection: $selectedGender, label: Text("Gender")) {
                ForEach(0 ..< genders.count) { index in
                    Text(genders[index]).tag(index)
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
            EmailField(email: $email)
            
            Text("Enter your password")
                .foregroundColor(.text)
                .padding(.bottom, 4)
                .padding(.top, 8)
            PasswordField(password: $password)
            
            Text("Confirm your password")
                .foregroundColor(.text)
                .padding(.bottom, 4)
                .padding(.top, 8)
            PasswordField(password: $confirmPassword, placeHolder: "Confirm Password")
        }
        .padding(.vertical, 6)
    }
    
    fileprivate func moreAboutYoutField() -> some View {
        return VStack(alignment: .leading) {
            Text("Tell us more about you")
                .foregroundColor(.text)
            TextEditor(text: $moreAboutYou)
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
