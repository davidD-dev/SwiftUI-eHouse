//
//  RoomService.swift
//  eHouse
//
//  Created by David Deschamps on 07/08/2021.
//

import Foundation
import Firebase
import FirebaseFirestoreTarget

struct RoomService {
    var db = Firestore.firestore()
    
    func getRooms(completion: @escaping ([Room]?) -> Void) {
        db.collection(K.FirebaseCollections.ROOM_COLLECTION)
            .getDocuments { query , error in
                if error != nil {
                    completion(nil)
                }
                
                guard let documents = query?.documents else {
                    completion(nil)
                    return
                }
                
                var fetchedRooms: [Room] = []
                
                for item in documents {
                    if let room = try? item.data(as: Room.self) {
                        fetchedRooms.append(room)
                    }
                }
                                
                completion(fetchedRooms)
            }
    }
    
}
