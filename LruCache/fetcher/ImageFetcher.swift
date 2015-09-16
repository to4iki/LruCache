//
//  ImageFetcher.swift
//  LruCache
//
//  Created by to4iki on 9/14/16.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

public final class ImageFetcher {
    
    /// LRUCache
    private var cache: LruCache<String, UIImage> = LruCache()
    
    /// Session
    private let session: NSURLSession = NSURLSession.sharedSession()
    
    /// Concrete data task
    private var task: NSURLSessionDataTask?
    
    /// MARK: Singleton
    public static let sharedInstance = ImageFetcher()
}

extension ImageFetcher {
    
    /**
    Cancels the task
    */
    public func cancel() {
        task?.cancel()
    }
    
    /**
    Resumes the task, if it is suspended
    */
    public func resume() {
        task?.resume()
    }
    
    /**
    Temporarily suspends a task
    */
    public func suspend() {
        task?.suspend()
    }
}

extension ImageFetcher {
    
    public func fetch(url: URLLiteralConvertible, successHandler: UIImage? -> Void) {
        gcd.async(.Default) {
            if let img = self.cache[url.string] {
                gcd.async(.Main) { successHandler(img) }
            
            } else {
            
                self.task = self.session.dataTaskWithURL(url.URL) { (data, res, err) in
                    guard let d = data else { return }
                    
                    let img = UIImage(data: d)
                    self.cache[url.string] = img
                    
                    gcd.async(.Main) { successHandler(img) }
                }
                
                self.resume()
            }
        }
    }
}
