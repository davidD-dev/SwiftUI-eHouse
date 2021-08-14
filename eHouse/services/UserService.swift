//
//  UserService.swift
//  eHouse
//
//  Created by David Deschamps on 12/08/2021.
//

import Foundation
import FirebaseFirestore


struct UserService {
    
    private var db = Firestore.firestore()
    
    
    
    func updateUserPicture(for user: User, with image: String, completion: @escaping (_ newUserId: String?, _ error: Error?) -> Void) {
        FirestoreUtils.getUserBy(userId: user.userId) { document, err in
            if err != nil  {
                completion(nil, err)
                return
            }
               
            if let doc = document {
                doc.updateData(["profilePicture" : image], completion: { err in
                            if err != nil {
                                completion(nil, err)
                            } else {
                                completion(user.userId, nil)
                            }
                        })
                } else {
                    completion(nil, nil)
                }
        }
    }
    
    func saveUser(userId: String) {
        db.collection(K.FirebaseCollections.USER_COLLECTION)
            .whereField("userId", isEqualTo: userId)
            .getDocuments { query , error in
                if error != nil {
                    return
                }
                
                guard let documents = query?.documents else {
                    return
                }
                
                if let user = try? documents.first?.data(as: User.self) {
                    UserDefaults.standard.set(true, forKey: K.UserFlags.LOGGED_IN)
                    
                    let encoder = JSONEncoder()
                    
                    if let encodedUser = try? encoder.encode(user) {
                        UserDefaults.standard.set(encodedUser, forKey: K.UserFlags.CURRENT_USER)
                    }
                }
                
            }
    }
}
