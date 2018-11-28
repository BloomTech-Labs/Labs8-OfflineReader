//
//  User.swift
//  Anywhere Reader
//
//  Created by Conner on 11/28/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

struct User: Codable {
    static var current: User!
    let username: String
    let email: String?
    let password1: String?
    let password2: String?
    var key: Key?
}
