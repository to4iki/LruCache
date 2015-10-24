//
//  NSURL+ImageFetcher.swift
//  LruCache
//
//  Created by to4iki on 9/14/16.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

extension NSURL: URLLiteralConvertible {
    
    public var string: String {
        return self.absoluteString
    }
    
    public var URL: NSURL {
        return self
    }
}