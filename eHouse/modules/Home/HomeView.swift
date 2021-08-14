//
//  HomeView.swift
//  eHouse
//
//  Created by David Deschamps on 03/08/2021.
//

import SwiftUI
import FirebaseFirestore

struct HomeView: View {
    @State private var openMenu = false
    
    let menuItems : [SideMenuItem] = [
        SideMenuItem(text: "Profile", icon: "person.fill", linkedView: AnyView(ProfileView())),
        SideMenuItem(text: "About us", icon: "info.circle", linkedView: AnyView(AboutUsView()))
    ]
    
    var body: some View {
//        NavigationView() {
            
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        Button(action: {onClick()}, label: {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.text)
                        })
                        .padding(.horizontal, 20)
                        .padding(.top, 25)
                    }
                    .padding(.bottom, 10)
                    RoomListView()
                    Spacer()
                }
                
                SideMenuView(width: UIScreen.main.bounds.width / 1.8, items: menuItems, open: $openMenu)
            }
            .onAppear {
                openMenu = false
            }
            .navigationBarHidden(true)
//        }
        
    }
    
    fileprivate func onClick() {
        openMenu = true
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
