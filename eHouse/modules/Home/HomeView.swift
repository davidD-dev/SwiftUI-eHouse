//
//  HomeView.swift
//  eHouse
//
//  Created by David Deschamps on 03/08/2021.
//

import SwiftUI
import FirebaseFirestore

struct HomeView: View {
    
    
    var body: some View {
        ZStack {
            RoomListView()
        }
        .navigationBarHidden(true)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
