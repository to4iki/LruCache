//
//  Factory.swift
//  LruCache
//
//  Created by to4iki on 2015/09/12.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

struct Factory {
    
    static func dictionary() -> Dictionary<String, Int> {
        return [
            "a": 1 ,"b": 2, "c": 3, "d": 4, "e": 5,
            "f": 6, "g": 7, "h": 8, "i": 9, "j": 10
        ]
    }
}