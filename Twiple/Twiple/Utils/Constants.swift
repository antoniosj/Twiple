//
//  Constants.swift
//  Twiple
//
//  Created by Antonio Silva on 14/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")
let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
