//
//  AnywhereReaderTests.swift
//  AnywhereReaderTests
//
//  Created by Samantha Gatt on 12/6/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import XCTest
@testable import Anywhere_Reader

class AnywhereReaderTests: XCTestCase {

    func testFetchArticlesWithValidData() {
        
        let expectation = self.expectation(description: "Fetch articles")

        let articleController = ArticleController(dataLoader: MockDataLoader.shared)
        
        articleController.fetchArticles() { (error) in
            
            XCTAssertNil(error)
            
            XCTAssertEqual(articleController.articleReps.count, 10)
            
            XCTAssertEqual(articleController.articleReps.first?.title, "Spyro: Reignited Trilogy – Every Cheat Code in the Game")
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testFetchArticlesWithBadData() {
        
        let expectation = self.expectation(description: "Fetch bad articles")
        
        let mockDataLoader = MockDataLoader(data: badData, error: nil)
        let articleController = ArticleController(dataLoader: mockDataLoader)
        
        articleController.fetchArticles { (error) in
            
            guard let unwrappedError = error else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(unwrappedError, NetworkError.badData)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testFetchArticlesWithNoData() {
        let expectation = self.expectation(description: "Fetch no articles")
        
        let mockDataLoader = MockDataLoader(data: nil, error: nil)
        let articleController = ArticleController(dataLoader: mockDataLoader)
        
        articleController.fetchArticles { (error) in
            
            guard let unwrappedError = error else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(unwrappedError, NetworkError.noData)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testFetchArticlesWithError() {
        let expectation = self.expectation(description: "Fetch articles with error")
        
        let mockDataLoader = MockDataLoader(data: nil, error: NSError(domain: "test error", code: 0, userInfo: nil) )
        let articleController = ArticleController(dataLoader: mockDataLoader)
        
        articleController.fetchArticles { (error) in
            
            guard let unwrappedError = error else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(unwrappedError, NetworkError.general)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
