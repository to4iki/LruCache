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
// https://github.com/spray/spray/blob/master/spray-caching/src/main/scala/spray/caching/LruCache.scala
class LruCacheTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDescription() {
        var cache: LruCache<String, Int> = try! LruCache(capacity: 5)
        cache["a"] = 1
        cache["b"] = 2
        cache["c"] = 3
        cache["d"] = 4
        cache["e"] = 5
        cache["f"] = 6
        cache["a"] = 1
        cache["b"] = 2
        cache["a"] = 1
        
        print("cache: \(cache)")
    } 
    
    func testPut1() {
        var cache: LruCache<String, Int> = try! LruCache(capacity: 2)
        cache["a"] = 1
        cache["b"] = 2
        cache["c"] = 3
        
        XCTAssert(cache.size() == 2)
        XCTAssertNil(cache["a"])
    }
    
    func testPut2() {
        var cache: LruCache<String, Int> = try! LruCache(capacity: 2)
        cache["a"] = 1
        cache["b"] = 2
        
        let _ = cache["a"]
        
        cache["c"] = 3
        
        XCTAssert(cache.size() == 2)
        XCTAssertNil(cache["b"])
    }
    
    func testCapacityExceeding() {
        let capacity = LruCache<String, Int>.maxCapacity + 1
        do {
            let _ = try LruCache<String, Int>(capacity: capacity)
        } catch LruCacheError.CapacityExceedingError(let n) {
            XCTAssert(n == capacity)
        } catch {
        }
    }
    
    func testSize() {
        var cache: LruCache<String, Int> = LruCache()
        XCTAssert(cache.size() == 0)
        
        cache["a"] = 1
        
        XCTAssert(cache.size() == 1)
    }
    
    func testRemoveAll() {
        var cache: LruCache<String, Int> = LruCache()
        cache["a"] = 1
        cache["b"] = 2
        
        XCTAssert(cache.size() == 2)
        
        cache.removeAll()
        XCTAssert(cache.size() == 0)
    }
    
    func testEqutable() {
        var cache1: LruCache<String, Int> = try! LruCache(capacity: 2)
        cache1["a"] = 1
        
        var cache2: LruCache<String, Int> = try! LruCache(capacity: 2)
        cache2["a"] = 1
        
        XCTAssertEqual(cache1, cache2)
        
        cache1["b"] = 2
        
        XCTAssertNotEqual(cache1, cache2)
    }
    
    func testPerformanceExample() {
        self.measureBlock() {
        }
    }
}
