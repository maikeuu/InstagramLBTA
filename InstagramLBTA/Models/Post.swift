//
//  Post.swift
//  InstagramLBTA
//
//  Created by Mike Lin on 7/28/18.
//  Copyright © 2018 Mike Lin. All rights reserved.
//

import Foundation

struct Post {
    let imageURL: String
    let user: User
    let caption: String
    
    
    init(user: User, dictionary: [String: Any]) {
        self.imageURL = dictionary["imageURL"] as? String ?? ""
        self.user = user
        self.caption = dictionary["caption"] as? String ?? ""
    }
}
