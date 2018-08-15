//
//  Post.swift
//  InstagramLBTA
//
//  Created by Mike Lin on 7/28/18.
//  Copyright © 2018 Mike Lin. All rights reserved.
//

import Foundation

struct Post {
    var id: String?
    
    let user: User
    let imageURL: String
    let caption: String
    let creationDate: Date
    
    
    init(user: User, dictionary: [String: Any]) {
        self.imageURL = dictionary["imageURL"] as? String ?? ""
        self.user = user
        self.caption = dictionary["caption"] as? String ?? ""
        let secondsFrom1970 = dictionary["creationDate"] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: secondsFrom1970)
    }
}
