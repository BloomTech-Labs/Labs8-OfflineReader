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
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
