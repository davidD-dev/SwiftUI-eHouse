//
//  ButtonView.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import SwiftUI

struct GradientButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.gradient)
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
}

// Permet d'appliquer un nouveau modificateur sur les objets de type Text
extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
