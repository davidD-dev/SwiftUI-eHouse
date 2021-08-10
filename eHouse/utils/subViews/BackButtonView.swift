//
//  BackButtonView.swift
//  eHouse
//
//  Created by David Deschamps on 10/08/2021.
//

import SwiftUI

struct BackButtonView: View {
    
    var onClick : () -> Void
    var text : String = ""
    
    var body: some View {
        Button(action: { onClick() }, label: {
            HStack {
                Image(systemName: "arrow.backward")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.title)
                Text(text)
                    .foregroundColor(.title)
            }
        })
        
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(onClick: {}, text: "Go back")
    }
}
