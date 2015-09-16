//
//  GcdFunction.swift
//  LruCache
//
//  Created by to4iki on 9/14/16.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

public typealias gcd = GcdFunction

enum QueueType {
    case Main
    case High
    case Default
    case Low
    case Background
    
    func getQueue() -> dispatch_queue_t {
        switch self {
        case .High:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        case .Default:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        case .Low:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
        case .Background:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        case .Main:
            fallthrough
        default:
            return dispatch_get_main_queue()
        }
    }
}

public struct GcdFunction {
    
    static func async(queueType: QueueType, f: () -> Void) {
        dispatch_async(queueType.getQueue(), f)
    }
}