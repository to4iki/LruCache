//
//  LinkedDictionary.swift
//  LruCache
//
//  Created by to4iki on 2015/09/06.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

/**
*  LinkedDictionary
*/
struct LinkedDictionary<K: Hashable, V>: Equatable {
    
    private(set) var head: Node<K, V>?
    var tail: Node<K, V>?
    
    init() {}
}

// MARK: - Data Operation

extension LinkedDictionary {
    
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
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
}

// MARK: - CustomStringConvertible

extension LinkedDictionary: CustomStringConvertible {
    var description: String {
        var str = ""
        var current = head
        
        while let node = current {
            str += "\(node) \n"
            current = node.next
        }
        return str
    }
}

// MARK: - Equatable

func == <K: Hashable, V>(lhs: LinkedDictionary<K, V>, rhs: LinkedDictionary<K, V>) -> Bool {
    return lhs.head == rhs.head && lhs.tail == rhs.tail
}
