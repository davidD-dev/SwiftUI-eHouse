//
//  RoomListView.swift
//  eHouse
//
//  Created by David Deschamps on 07/08/2021.
//

import SwiftUI

struct RoomListView: View {
    
    @ObservedObject private var roomLisViewModel = RoomListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(roomLisViewModel.rooms, id: \.localId) { room in
                        RoomRow(room: room)
                            .background(Color
                                            .primary
                                            .colorInvert()
                                            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 4))
                    }
                }
                .background(Color.tableBackground)
            }
            .navigationTitle("Rooms")
        }
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
    }
}
