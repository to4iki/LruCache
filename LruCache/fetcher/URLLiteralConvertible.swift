//
//  URLLiteralConvertible.swift
//  LruCache
//
//  Created by to4iki on 9/14/16.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

public protocol URLLiteralConvertible {
    var string: String { get }
    
    var URL: NSURL { get }
}