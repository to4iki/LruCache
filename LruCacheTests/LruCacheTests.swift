//
//  LruCacheTests.swift
//  LruCacheTests
//
//  Created by to4iki on 2015/09/05.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import XCTest
import LruCache

class LruCacheTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPut() {
        var cache: LruCache<String, String> = LruCache(capacity: 2)
        cache["a"] = "first"
        cache["b"] = "second"
        cache["c"] = "third"
        
        XCTAssert(cache["a"] == nil)
    }
    
    func testPut2() {
        var cache: LruCache<String, String> = LruCache(capacity: 2)
        cache["a"] = "first"
        cache["b"] = "second"

        let a = cache["a"]
        
        cache["c"] = "third"
        
        XCTAssert(cache["b"] == nil)
    }
    
//    func testEx3() {
//        var cache: LruCache<String, Float> = LruCache(capacity: 7)
//        cache["AAPL"] = 114.63
//        cache["GOOG"] = 533.75
//        cache["YHOO"] = 50.67
//        cache["TWTR"] = 38.91
//        cache["BABA"] = 109.89
//        cache["YELP"] = 55.17
//        cache["BABA"] = 109.80
//        cache["TSLA"] = 231.43
//        cache["AAPL"] = 113.41
//        cache["GOOG"] = 533.60
//        cache["AAPL"] = 113.01
//        
//        if let item = cache["AAPL"] {
//            print("Key: AAPL Value: \(item)")
//        } else {
//            print("Item not found.")
//        }
//        
//         print(cache)
//    }
    
    func testPerformanceExample() {
        self.measureBlock() {
        }
    }
}
