//
//  RegisterTypeView.swift
//  eHouse
//
//  Created by David Deschamps on 01/08/2021.
//

import SwiftUI

struct RegisterTypeView: View {
    
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
            VStack {
                ScreenTitle("What are you looking for ?")
                LazyVGrid(columns: gridColumns, alignment: .center, spacing: 24) {
                    
                    RegisterTypeCard(gradientStartColor: .roomStart, gradientEndColor: .roomEnd, image: K.IconNames.room, cardText: "Room")
                    
                    RegisterTypeCard(gradientStartColor: .placeStart, gradientEndColor: .placeEnd, image: K.IconNames.entirePlace, cardText: "Entire PLace")
                    
                    RegisterTypeCard(gradientStartColor: .roommateStart, gradientEndColor: .roommateEnd, image: K.IconNames.roommate, cardText: "Roomate")
                    
                    RegisterTypeCard(gradientStartColor: .tenantStart, gradientEndColor: .tenantEnd, image: K.IconNames.tenant, cardText: "Tenant")
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .navigationTitle("Step 1-4")
            }
            .frame(maxHeight: .infinity)
    }
}

struct RegisterTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterTypeView()
    }
}
