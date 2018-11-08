//
//  UserService.swift
//  Anywhere Reader
//
//  Created by Conner on 11/8/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation
import Firebase

let database = Database.database().reference()

class UserService {
    static let instance = UserService()
    
    // MARK: - Private variables
    private var _users = database.child("users")
    
    // MARK: - Public
    var users: DatabaseReference { return _users }
    
    // MARK: - Functions
    func createUser(uid: String, userData: Dictionary<String, Any>) {
        users.child(uid).updateChildValues(userData)
    }
}
