//
//  NetworkDataLoader.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(with request: URLRequest, completion: @escaping( Data?, Error?) -> Void)
    func loadData(from url: URL, completion: @escaping( Data?, Error?) -> Void)
    func uploadData(with request: URLRequest, completion: @escaping( Data?, Error?) -> Void)
    func uploadData(to url: URL, completion: @escaping( Data?, Error?) -> Void)
    func deleteData(with request: URLRequest, completion: @escaping( Data?, Error?) -> Void)
    func deleteData(with url: URL, completion: @escaping( Data?, Error?) -> Void)
}

extension URLSession: NetworkDataLoader {
    
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: url) { data, _, error in
            completion(data, error)
            }.resume()
    }
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: request) { (data, _, error) in
            completion(data, error)
            }.resume()
    }
    func uploadData(to url: URL, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: url) { data, _, error in
            completion(data, error)
            }.resume()
    }
    
    func uploadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: request) { (data, _, error) in
            completion(data, error)
            }.resume()
    }
    func deleteData(with url: URL, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: url) { data, _, error in
            completion(data, error)
            }.resume()
    }
    
    func deleteData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: request) { (data, _, error) in
            completion(data, error)
            }.resume()
    }
}
