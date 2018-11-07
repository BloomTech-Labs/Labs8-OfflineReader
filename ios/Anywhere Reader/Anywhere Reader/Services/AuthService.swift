//
//  AuthService.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

class AuthService {
    static let instance = AuthService()
    
    // MARK: - Registration
    func registerUser(withEmail email: String,
                      andPassword password: String,
                      userRegistrationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        // 1. Send email and password to server and await response
        // 2. Call userRegistrationComplete completion closure with true if user registration is a success
    }
    
    // MARK: - Login User
    func loginUser(withEmail email: String,
                   andPassword password: String,
                   userLoginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        // 1. Send email and password to server and await response
        // 2. Call userLoginComplete completion closure if login is a success
    }
}
