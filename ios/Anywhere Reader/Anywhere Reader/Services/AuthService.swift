//
//  AuthService.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    // MARK: - Registration
    func registerUser(withEmail email: String,
                      andPassword password: String,
                      userRegistrationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else {
                userRegistrationComplete(false, error)
                return
            }
            
            let userData = [ "provider": user.providerID, "email": user.email ]
            
            UserService.instance.createUser(uid: user.uid, userData: userData as Dictionary<String, Any>)
            userRegistrationComplete(true, nil)
        }
    }
    
    // MARK: - Login User
    func loginUser(withEmail email: String,
                   andPassword password: String,
                   userLoginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error else {
                userLoginComplete(false, error)
                return
            }
            
            userLoginComplete(true, nil)
        }
    }
}
