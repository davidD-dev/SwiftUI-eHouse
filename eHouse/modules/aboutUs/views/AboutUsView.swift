//
//  AboutUsView.swift
//  eHouse
//
//  Created by David Deschamps on 09/08/2021.
//

import SwiftUI

struct AboutUsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("About us")
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(onClick: onClick))
    }
    
    fileprivate func onClick() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
