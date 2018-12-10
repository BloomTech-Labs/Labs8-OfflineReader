//
//  MockDataLoader.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 12/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import Foundation

class MockDataLoader: NetworkDataLoader {
    
    // MARK: - Initializer
    
    init(data: Data? = nil, error: Error? = nil) {
        self.data = data
        self.error = error
    }
    
    // MARK: - Static properties
    
    static let mockDataUrl = Bundle.main.url(forResource: "example", withExtension: "json")!
    static let mockData = try! Data(contentsOf: mockDataUrl)
    static let shared = MockDataLoader(data: mockData, error: nil)
    
    
    // MARK: - Properties
    
    let data: Data?
    let error: Error?
    private(set) var request: URLRequest? = nil
    private(set) var url: URL? = nil
    
    
    // MARK: - NetworkDataLoader functions
    
    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        self.url = url
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
    }
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
    }
    
    func uploadData(to url: URL, completion: @escaping (Data?, Error?) -> Void) {
        self.url = url
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
    }
    
    func uploadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
    }
    
    func deleteData(with url: URL, completion: @escaping (Data?, Error?) -> Void) {
        self.url = url
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
    }
    
    func deleteData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        DispatchQueue.global().async {
            completion(self.data, self.error)
        }
    }
}
