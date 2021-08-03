//
//  PasswordField.swift
//  eHouse
//
//  Created by David Deschamps on 03/08/2021.
//

import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    
    var placeHolder = "Password"
    
    var body: some View {
        HStack {
            Image(systemName: "key")
                .foregroundColor(.text.opacity(0.7))
            SecureField(placeHolder, text: $password)
        }
        .font(.title3)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.text.opacity(0.7), lineWidth: 1))
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(password: .constant(""))
    }
}
