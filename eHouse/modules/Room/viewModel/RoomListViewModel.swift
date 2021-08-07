//
//  RoomListViewModel.swift
//  eHouse
//
//  Created by David Deschamps on 07/08/2021.
//

import Foundation

class RoomListViewModel: ObservableObject {
    @Published var rooms: [Room] = []
    
    private var roomService = RoomService()
    
    init() {
        roomService.getRooms { data in
            DispatchQueue.main.async {
                if let fetchedRooms =  data {
                    self.rooms = fetchedRooms
                }
            }
        }
    }
    
}
