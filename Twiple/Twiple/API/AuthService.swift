//
//  AuthService.swift
//  Twiple
//
//  Created by Antonio Silva on 14/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        print("DEBUG: email is \(email)")
    }
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        
        print("DEBUG: Image data ok")
        
        let filename = NSUUID().uuidString

        
        print("DEBUG: filename: \(filename)")
        
        let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        
        storageRef.putData(imageData, metadata: nil) { (meta, error) in
            storageRef.downloadURL { (url, error) in
                
                print("DEBUG: storageRef: \(String(describing: url?.absoluteString))")
                
                Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                    
                    if let error = error {
                        print("DEBUG: Error is \(error.localizedDescription)")
                        return
                    }
                    guard let uid = result?.user.uid else {
                        print("DEBUG: Error uid")
                        return
                    }
                    
                    guard let profileImageUrl = url?.absoluteString else {
                        print("DEBUG: Error profileImageUrl")
                        return
                        
                    }
                    
                    let values = ["email": credentials.email, "username": credentials.username, "fullname": credentials.fullname, "profileImageUrl": profileImageUrl]
                    
                    print("DEBUG: REGISTERING USER")
                    
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                    
                }
            }
        }
    }
}
