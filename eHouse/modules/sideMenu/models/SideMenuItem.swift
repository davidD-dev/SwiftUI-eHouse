//
//  SideMenuItem.swift
//  eHouse
//
//  Created by David Deschamps on 09/08/2021.
//

import SwiftUI

struct SideMenuItem: Identifiable {
    var id = UUID()
    
    let text : String
    let icon : String
    let linkedView : AnyView
    var handler : () -> Void = {
        print("COUCOU")
    }
}
