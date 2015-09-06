//
//  LinkedDictionary.swift
//  LruCache
//
//  Created by to4iki on 2015/09/06.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

class Node<K: Hashable, V> {
    
    var key: K
    var value: V?
    var previous: Node?
    var next: Node?
    
    init(key: K, value: V?) {
        self.key = key
        self.value = value
    }
}

struct LinkedDictionary<K: Hashable, V> {
    
    var head: Node<K, V>? = nil
    var tail: Node<K, V>? = nil
    
    init() {}
    
    mutating func unshift(node: Node<K, V>) {
        if head == nil  {
            head = node
            tail = node
        } else {
            let tmp = head
            
            head?.previous = node
            head = node
            head?.next = tmp
        }
    }
    
    mutating func remove(node: Node<K, V>) {
        if node === head {
            head = head?.next
            head?.previous = nil
        } else if node.next != nil {
            node.previous?.next = node.next
            node.next?.previous = node.previous
        } else {
            node.previous?.next = nil
            tail = node.previous
        }
    }
}

/// MARK: - CustomStringConvertible

extension LinkedDictionary: CustomStringConvertible {
    var description: String {
        var s = ""
        var current = head
        
        while let node = current {
            s += "key:\(node.key), value:\(node.value) \n"
            current = node.next
        }
        return s
    }
}
