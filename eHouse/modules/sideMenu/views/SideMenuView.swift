//
//  SideMenuView.swift
//  eHouse
//
//  Created by David Deschamps on 09/08/2021.
//

import SwiftUI

struct SideMenuView: View {
    
    let width: CGFloat
    let items: [SideMenuItem]
    @Binding var open : Bool
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(open ? 1 : 0)
            .animation(.easeIn.delay(0.25))
            .onTapGesture {
                open = false
            }
            
            HStack {
                SideMenuContent(items: items)
                    .frame(width: width)
                    .offset(x: open ? UIScreen.main.bounds.width - width : 2*width)
                    .animation(.default)
                
                Spacer()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(width: 370, items: [] ,open: .constant(true))
    }
}
