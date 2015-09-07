//
//  Node.swift
//  LruCache
//
//  Created by to4iki on 2015/09/08.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

/**
*  Node
*/
class Node<K: Hashable, V> {
    
    let key: K
    var value: V?
    var previous: Node?
    var next: Node?
    
    init(key: K, value: V?) {
        self.key = key
        self.value = value
    }
}

// MARK: - CustomStringConvertible

extension Node: CustomStringConvertible {
    var description: String {
        return "Node(key:\(key), value:\(value))"
    }
}
