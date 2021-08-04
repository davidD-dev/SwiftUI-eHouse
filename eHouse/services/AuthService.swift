//
//  AuthService.swift
//  eHouse
//
//  Created by David Deschamps on 04/08/2021.
//

import Foundation

struct AuthService {
    
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
        
    }
}
