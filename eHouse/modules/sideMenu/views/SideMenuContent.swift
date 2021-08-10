//
//  SideMenuContent.swift
//  eHouse
//
//  Created by David Deschamps on 09/08/2021.
//

import SwiftUI

struct SideMenuContent: View {
    
    var items : [SideMenuItem] = []
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1))
            
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(items) { item in
                        NavigationLink(
                            destination: item.linkedView,
                            label: {
                                HStack {
                                    Image(systemName: item.icon)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.white)
                                    
                                    Text(item.text)
                                        .bold()
                                        .font(.system(size: 22))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                }
                                .padding()
                            })
                        
                        Divider()
                    }
                }
                
                Spacer()
                
                LogoutButton()
                    .padding(.vertical, 40)
            }
            .padding(.horizontal, 20)
            .padding(.top, 40)
        }
    }
}

struct SideMenuContent_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuContent(items: [
            SideMenuItem(text: "Profile", icon: "person.fill", linkedView: AnyView(AboutUsView())),
            SideMenuItem(text: "About us", icon: "info.circle", linkedView: AnyView(AboutUsView()))
            
        ])
    }
}
