//
//  ScreenTitle.swift
//  eHouse
//
//  Created by David Deschamps on 30/07/2021.
//

import SwiftUI

struct ScreenTitle: View {
    var title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.title)
                .padding(.bottom, 30)
                .padding(.leading, 20)
            Spacer()
        }
    }
}

struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTitle("Title")
            .previewLayout(.sizeThatFits)
    }
}
