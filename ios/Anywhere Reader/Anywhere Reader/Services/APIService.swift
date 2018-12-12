//
//  APIService.swift
//  Anywhere Reader
//
//  Created by Conner on 12/10/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

enum Result {
    case success
    case failure
}

class APIService {
    static let shared = APIService()
    static let baseURL = URL(string: "https://anywhere-reader-test.herokuapp.com")!
    static var currentUserToken = ""
    
    /// - Author: Conner Alegre
    func verifyAccessToken(with accessToken: String, completion: @escaping (Result, Error?) -> Void) {
        let url = APIService.baseURL.appendingPathComponent("auth").appendingPathComponent("convert_token/")
        var request = URLRequest(url: url)
        let body: [String: Any] = ["token": accessToken]
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                NSLog("Error with GETting verified token: \(error)")
                completion(.failure, error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let tokenInformation = try JSONDecoder().decode(TokenInformation.self, from: data)
                APIService.currentUserToken = tokenInformation.accessToken
            } catch {
                NSLog("Error with decoding Token Information")
            }
            
            completion(.success, nil)
        }.resume()
    }
    
    /**
     Revokes current token stored in the `APIService` static varible: `currentUserToken`
     
     - Author: Samantha Gatt
     */
    func signOut(completion: @escaping (Result, Error?) -> Void) {
        let url = APIService.baseURL.appendingPathComponent("auth").appendingPathComponent("revoke_token/")
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: ["token": APIService.currentUserToken])
        
        
        URLSession.shared.dataTask(with: request) { (_, _, error) in
            if let error = error {
                NSLog("Error revoking token: \(error)")
                completion(.failure, error)
                return
            }
            completion(.success, nil)
        }.resume()
    }
}
