//
//  User.swift
//  Twiple
//
//  Created by Antonio Silva on 21/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import Foundation

struct User {
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: URL?
    let uid: String
    
    init(uid: String, dicitionary: [String: AnyObject]) {
        self.uid = uid
        
        self.fullname = dicitionary["fullname"] as? String ?? ""
        self.email = dicitionary["email"] as? String ?? ""
        self.username = dicitionary["username"] as? String ?? ""
        if let profileImageUrlString = dicitionary["profileImageUrl"] as? String {
            guard let url = URL(string: profileImageUrlString) else { return }
            self.profileImageUrl = url
        }
    }
}
