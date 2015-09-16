//
//  String+ImageFetcher..swift
//  LruCache
//
//  Created by to4iki on 9/14/16.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

extension String: URLLiteralConvertible {
    
    public var string: String {
        return self
    }
    
    public var URL: NSURL {
        if let str = stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet()) {
            return NSURL(string: str)!
        } else {
            return NSURL(string: self)!
        }
    }
}