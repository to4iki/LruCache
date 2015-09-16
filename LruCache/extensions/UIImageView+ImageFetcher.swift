//
//  UIImageView+ImageFetcher.swift
//  LruCache
//
//  Created by to4iki on 9/14/16.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

extension UIImageView {
    
    public func fetch(url: URLLiteralConvertible) {
        ImageFetcher.sharedInstance.fetch(url) {
            self.image = $0
        }
    }
 }