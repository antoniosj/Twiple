//
//  UserService.swift
//  Twiple
//
//  Created by Antonio Silva on 15/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import Foundation
import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(completion: @escaping(User) -> Void) {
        
        print("DEBUG: FetchUser")
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return } // snapshot = dados (como json +-) // key = hash e value = dados
            print("DEBUG: Dcitionary: \(dictionary)")
            
            guard let username = dictionary["username"] as? String else { return }
            
            let user = User(uid: uid, dicitionary: dictionary)
            print("DEBUG USERNAME1: \(username)")

            print("DEBUG USERNAME: \(user.username)")
            completion(user)
        }
    }
}
