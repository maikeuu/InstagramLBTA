//
//  FirebaseUtils.swift
//  InstagramLBTA
//
//  Created by Mike Chu on 8/13/18.
//  Copyright © 2018 Mike Lin. All rights reserved.
//

import Foundation
import Firebase

extension Database {
    static func fetchUserWithUID(uid: String, completion: @escaping (User) -> ()) {
        let ref =  Database.database().reference().child("posts").child(uid)
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let userDictionary = snapshot.value as? [String: Any] else { return }
            let user = User(uid: uid, dictionary: userDictionary)
            completion(user)
        }) { (err) in
            print("Failed to fetch user for post", err)
        }
    }
}
