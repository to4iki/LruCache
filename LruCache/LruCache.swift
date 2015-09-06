//
//  LruCache.swift
//  LruCache
//
//  Created by to4iki on 2015/09/07.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

public struct LruCache<K: Hashable, V>: Equatable {
    
    public let capacity: Int
    private var length = 0
    private lazy var hashTable: Dictionary<K, Node<K, V>> = Dictionary(minimumCapacity: self.capacity)
    private lazy var queue: LinkedDictionary<K, V> = LinkedDictionary()
    
    public init(capacity: Int) {
        // TODO: 10 limit
        self.capacity = capacity
    }
    
    public subscript (key: K) -> V? {
        mutating get {
            if let node = hashTable[key] {
                updateQueue(node)
                return node.value
            } else {
                return nil
            }
        }
        
        set(value) {
            if let node = hashTable[key] {
                node.value = value
                updateQueue(node)
                
            } else {
                let node = Node(key: key, value: value)
                
                if self.length < capacity {
                    save(node)
                    length++
                    
                } else  {
                    hashTable.removeValueForKey(self.queue.tail!.key)
                    queue.tail = queue.tail?.previous
                    
                    if let node = self.queue.tail {
                        node.next = nil
                    }
                    
                    save(node)
                }
            }
        }
    }
    
    private mutating func save(node: Node<K, V>) {
        queue.unshift(node)
        hashTable[node.key] = node
    }
    
    private mutating func updateQueue(node: Node<K, V>) {
        queue.remove(node)
        queue.unshift(node)
    }
}


// MARK: - CustomStringConvertible

extension LruCache {
    public mutating func display() -> String {
        return "LruCache(\(length)): \n\(queue)"
    }
}

// MARK: - Equatable

public func == <K: Hashable, V>(lhs: LruCache<K, V>, rhs: LruCache<K, V>) -> Bool {
    return true
}