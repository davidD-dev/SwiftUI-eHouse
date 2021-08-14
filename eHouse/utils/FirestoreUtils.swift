//
//  FirestoreUtils.swift
//  eHouse
//
//  Created by David Deschamps on 14/08/2021.
//

import Foundation
import FirebaseFirestore

struct FirestoreUtils {
    
    static func getUserBy(userId: String, completion: @escaping (_ document: DocumentReference?, _ error: Error?) -> Void) {
        var db = Firestore.firestore()
        db.collection(K.FirebaseCollections.USER_COLLECTION).whereField("userId", isEqualTo: userId).getDocuments { query, error in
            if error != nil {
                completion(nil, error)
                return
            }
            
            guard let documents = query?.documents else {
                completion(nil, nil)
                return
            }
            
            
            if let doc = documents.first?.reference {
                completion(doc, nil)
            }
            
            completion(nil, nil)
        }
    }
}
