//
//  Room.swift
//  eHouse
//
//  Created by David Deschamps on 07/08/2021.
//

import Foundation
import FirebaseFirestoreSwift

struct Room: Identifiable, Codable {
    
    @DocumentID var id: String?
    
    let localId: String
    let beds: Int
    let description: String
    let price: Int
    let image: String
    let userName: String
    let userType: String
    let userAvatar: String
    var booked: Bool
}

let roomData = [
  Room(localId: UUID().uuidString, beds: 2, description: "Nice Double Room with Own Bathroom", price: 400, image: "img_room", userName: "Susie Jenkins", userType: "Roommate", userAvatar: "susie", booked: false),
  Room(localId: UUID().uuidString, beds: 2, description: "Double Room with Big TV and PS5", price: 650, image: "img_room2", userName: "Nyle Bailey", userType: "Roommate", userAvatar: "nyle", booked: false),
  Room(localId: UUID().uuidString, beds: 3, description: "Luxury 3-bed Apartment Bathroom", price: 1500, image: "img_room_luxury", userName: "Max Wilcox", userType: "Landlord", userAvatar: "max", booked: false),
  Room(localId: UUID().uuidString, beds: 3, description: "Spooky house at the end of the city", price: 700, image: "img_room_spooky", userName: "Sasha Strong", userType: "Roommate", userAvatar: "sasha", booked: false)
]

