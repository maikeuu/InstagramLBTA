//
//  User.swift
//  InstagramLBTA
//
//  Created by Mike Lin on 7/29/18.
//  Copyright © 2018 Mike Lin. All rights reserved.
//

import Foundation

struct User {
    
    let uid: String
    let username: String
    let profileImageURL: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid 
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
    }
}
