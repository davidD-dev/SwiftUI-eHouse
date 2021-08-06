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
    
    // Return the current user connected
    func getCurrentUser() -> User? {
        guard Auth.auth().currentUser != nil else {
            return nil
        }
        
        if let savedUser = UserDefaults.standard.object(forKey: K.UserFlags.CURRENT_USER) as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                return loadedUser
            }
        }
        return nil
    }
    
    // Login a user
    func loginUser(withEmail email: String, andPassword password: String, completion: @escaping (_ error: Error?) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            guard err == nil else  {
                completion(err)
                return
            }
            
            guard result != nil else {
                return
            }
            self.saveUser(userId: result!.user.uid)
            completion(nil)
            
        }
        
    }
    
    // Request for a password reset
    func sendPasswordReset(email: String, completion: @escaping () -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion()
        }
       
    }
    
    // Register a user
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
    
    private func saveUser(userId: String) {
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
