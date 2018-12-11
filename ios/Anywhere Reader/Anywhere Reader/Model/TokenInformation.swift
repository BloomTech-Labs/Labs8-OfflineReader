//
//  TokenInformation.swift
//  Anywhere Reader
//
//  Created by Conner on 12/10/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

struct TokenInformation: Codable {
    let accessToken: String
    let expiresIn: Int
    let tokenType: String
    let scope: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case tokenType = "token_type"
        case scope = "scope"
        case refreshToken = "refresh_token"
    }
}
