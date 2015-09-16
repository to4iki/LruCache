//
//  Factory.swift
//  LruCache
//
//  Created by to4iki on 2015/09/12.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import UIKit

struct Factory {
    
    private class TestSampelImage {}
    
    static let URL_2100x2970 = NSBundle(forClass: TestSampelImage.self).URLForResource("2100x2970", withExtension: "gif")!
    static let URL_1050x14850 = NSBundle(forClass: TestSampelImage.self).URLForResource("1050x1485", withExtension: "gif")!
    
    static let randomBool = arc4random_uniform(10) % 2 == 0
}

extension Factory {

    static func image(url: NSURL) -> UIImage {
        let d = NSData(contentsOfURL: URL_2100x2970)!
        return UIImage(data: d)!
    }
    
    static func dictionary(n: Int = 10) -> Dictionary<String, UIImage> {
        return Array(1...n).reduce([:]) { (var acc: [String:UIImage], x: Int) in
            acc[String(x)] = randomBool ? image(URL_2100x2970) : image(URL_1050x14850)
            return acc
        }
    }
}