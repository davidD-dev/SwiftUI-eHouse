//
//  RegisterMoveDetailsView.swift
//  eHouse
//
//  Created by David Deschamps on 02/08/2021.
//

import SwiftUI

struct RegisterMoveDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var onboardingDetails: UserOnboardingDetails
    
    var body: some View {
        VStack {
            RegisterMoveDetailsContent()
                .padding(.top, 40)
            Spacer()
            NavigationLink(
                destination: RegisterProfileView().environmentObject(onboardingDetails)) {
                Text("NEXT")
                    .bold()
                    .textStyle(GradientButtonStyle())
                    .padding(.bottom, 20)
            }
        }
        .navigationTitle("Step 3-4")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButtonView(onClick: onClick, text: "Step 2-4"))
    }
    
    fileprivate func onClick() {
        presentationMode.wrappedValue.dismiss()
    }
}

//MARK:- Preview

struct RegisterMoveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterMoveDetailsView()
            .environmentObject(UserOnboardingDetails())
    }
}
