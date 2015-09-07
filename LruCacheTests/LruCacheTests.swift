//
//  LruCacheTests.swift
//  LruCacheTests
//
//  Created by to4iki on 2015/09/05.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import XCTest
import LruCache

// http://qiita.com/shirochan/items/10271912289dc563cc36
class LruCacheTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPut1() {
        var cache: LruCache<String, String> = LruCache(capacity: 2)
        cache["a"] = "first"
        cache["b"] = "second"
        cache["c"] = "third"
        
        XCTAssert(cache.size() == 2)
        XCTAssertNil(cache["a"])
    }
    
    func testPut2() {
        var cache: LruCache<String, String> = LruCache(capacity: 2)
        cache["a"] = "first"
        cache["b"] = "second"

        let _ = cache["a"]
        
        cache["c"] = "third"

        XCTAssert(cache.size() == 2)
        XCTAssertNil(cache["b"])
    }
    
    func testSize() {
        var cache: LruCache<String, String> = LruCache(capacity: 2)
        XCTAssert(cache.size() == 0)
        
        cache["a"] = "first"
        
        XCTAssert(cache.size() == 1)
    }
    
    func testPerformanceExample() {
        self.measureBlock() {
        }
    }
}
