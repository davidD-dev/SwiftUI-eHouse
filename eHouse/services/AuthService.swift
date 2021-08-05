//
//  AuthService.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

struct AuthService {
    
    private var db = Firestore.firestore()
    
    func getCurrentUser() -> User? {
        return nil
    }
    
    func loginUser(withEmail email: String, andPassword password: String, completion: @escaping (_ error: Error?) -> Void) {
        completion(nil)
    }
    
    func sendPasswordReset(email: String, completion: @escaping () -> Void) {
        completion()
    }
    
    func resgister(user: User, completion: @escaping (_ error: Error?) -> Void) {
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, err in
            guard err == nil else  {
                completion(err)
                return
            }
            
            guard let authResult = result else {
                return
            }
            
            user.userId = authResult.user.uid
            
            do {
              let _ = try db.collection(K.FirebaseCollections.USER_COLLECTION).addDocument(from: user)
                completion(nil)
                
            } catch let registerError {
                completion(registerError)
            }
        }
        
    }
}
