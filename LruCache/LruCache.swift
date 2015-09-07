//
//  LruCache.swift
//  LruCache
//
//  Created by to4iki on 2015/09/07.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

public struct LruCache<K: Hashable, V> {
    
    public let capacity: Int
    
    private var length = 0
    private lazy var hashTable: [K: Node<K, V>] = Dictionary(minimumCapacity: self.capacity)
    private lazy var queue: LinkedDictionary<K, V> = LinkedDictionary()
    
    public init(capacity: Int) {
        // TODO: 10 limit
        self.capacity = capacity
    }
}

// MARK: - Data Operation

extension LruCache {
    
    public subscript (key: K) -> V? {
        mutating get {
            if let node = hashTable[key] {
                update(node)
                return node.value
            } else {
                return nil
            }
        }
        
        set(value) {
            if let node = hashTable[key] {
                node.value = value
                update(node)
                
            } else {
                let node = Node(key: key, value: value)
                if self.length < capacity {
                    save(node)
                    length++
                } else {
                    remove()
                    save(node)
                }
            }
        }
    }
    
    public mutating func size() -> Int {
        return hashTable.count
    }
    
    private mutating func save(node: Node<K, V>) {
        queue.unshift(node)
        hashTable[node.key] = node
    }
    
    private mutating func update(node: Node<K, V>) {
        queue.remove(node)
        queue.unshift(node)
    }
    
    private mutating func remove() {
        guard let last = queue.tail else {
            return
        }
        hashTable.removeValueForKey(last.key)
        queue.tail = last.previous
        queue.tail?.next = nil
    }
}

// MARK: - CustomStringConvertible

extension LruCache {
    public mutating func display() -> String {
        return "LruCache(\(length)): \n\(queue)"
    }
}
