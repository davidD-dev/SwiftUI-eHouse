//
//  EmailField.swift
//  eHouse
//
//  Created by David Deschamps on 01/08/2021.
//

import SwiftUI

struct EmailField: View {
    @Binding var email: String
    var body: some View {
        HStack {
            Image(systemName: "envelope")
                .foregroundColor(.text.opacity(0.7))
            TextField("Email address", text: $email)
                // Permet de spécifié le type de clavier qui sera
                // afficher quand on tape sur le textField
                .keyboardType(.emailAddress)
                .autocapitalization(.none)            
        }
        .font(.title3)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.text.opacity(0.7), lineWidth: 1))
    }
}

struct EmailField_Previews: PreviewProvider {
    static var previews: some View {
        // .constant permet de créer une Binding constante à
        // donner au EmailField
        EmailField(email: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
