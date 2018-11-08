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
    static let baseURL = URL(string: "")!
    
    // MARK: - Registration
    func registerUser(withEmail email: String,
                      andPassword password: String,
                      userRegistrationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        // 1. Send email and password to server and await response
        // 2. Call userRegistrationComplete completion closure with true if user registration is a success
        let url = AuthService.baseURL
        let user = User(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        //  encode the user and set the httpBody to the newly encoded user
        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            NSLog("Unable to encode \(user): \(error)")
            userRegistrationComplete(false, error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error with registering new user: \(error)")
                userRegistrationComplete(false, error)
                return
            }
            
            userRegistrationComplete(true, nil)
        }.resume()
    }
    
    // MARK: - Login User
    func loginUser(withEmail email: String,
                   andPassword password: String,
                   userLoginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        // 1. Send email and password to server and await response
        // 2. Call userLoginComplete completion closure if login is a success
        let url = AuthService.baseURL
        let user = User(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        //  encode the user and set the httpBody to the newly encoded user
        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            NSLog("Unable to encode \(user): \(error)")
            userLoginComplete(false, error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error with logging in with user \(user) - \(error)")
                userLoginComplete(false, error)
                return
            }
            
            userLoginComplete(true, nil)
        }.resume()
    }
}

// TODO: Temporary structure for request setup, create proper structure
struct User: Codable {
    let email: String
    let password: String
}
