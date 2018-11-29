//
//  AuthService.swift
//  Anywhere Reader
//
//  Created by Conner on 11/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

class AuthService {
    static let shared = AuthService()
    static let baseURL = URL(string: "http://localhost:8000/")!
    
    // MARK: - Registration
    func registerUser(withEmail email: String,
                      andPassword password: String,
                      andUsername username: String,
                      userRegistrationComplete: @escaping (_ status: Bool, _ error: Error?, _ user: User?) -> ()) {
        
        // 1. Send email and password to server and await response
        // 2. Call userRegistrationComplete completion closure with true if user registration is a success
        
        var key: Key?
        
        // http://localhost:8000/api/rest-auth/registration/
        let url = AuthService.baseURL
            .appendingPathComponent("api")
            .appendingPathComponent("rest-auth")
            .appendingPathComponent("registration/")
        var user = User(username: username, email: email, password1: password, password2: password, key: nil)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        //  encode the user and set the httpBody to the newly encoded user
        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            NSLog("Unable to encode \(user): \(error)")
            userRegistrationComplete(false, error, nil)
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error with registering new user: \(error)")
                userRegistrationComplete(false, error, nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                key = try JSONDecoder().decode(Key.self, from: data)
            } catch {
                NSLog("Error decoding key")
            }
            
            user.key = key
            
            userRegistrationComplete(true, nil, user)
        }.resume()
    }
    
    // MARK: - Login User
    func loginUser(withUsername username: String,
                   andPassword password: String,
                   userLoginComplete: @escaping (_ status: Bool, _ error: Error?, _ user: User?) -> ()) {
        // 1. Send email and password to server and await response
        // 2. Call userLoginComplete completion closure if login is a success
        var key: Key?
        let url = AuthService.baseURL
            .appendingPathComponent("api")
            .appendingPathComponent("rest-auth")
            .appendingPathComponent("login/")
        let user = ["username": username, "password": password]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        //  encode the user and set the httpBody to the newly encoded user
        do {
            request.httpBody = try JSONEncoder().encode(user)
        } catch {
            NSLog("Unable to encode \(user): \(error)")
            userLoginComplete(false, error, nil)
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error with logging in with user \(user) - \(error)")
                userLoginComplete(false, error, nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                key = try JSONDecoder().decode(Key.self, from: data)
            } catch {
                NSLog("Error decoding key")
            }
            
            let user = User(username: username, email: nil, password1: nil, password2: nil, key: key)

            userLoginComplete(true, nil, user)
        }.resume()
    }
}

// TODO: Temporary structure for request setup, create proper structure
struct Key: Codable {
    let key: String
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
    }
}
