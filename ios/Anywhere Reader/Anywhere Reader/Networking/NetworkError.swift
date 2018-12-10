//
//  NetworkError.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
    case noData
    case badData
    case general
}
