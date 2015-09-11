//
//  LruCache.swift
//  LruCache
//
//  Created by to4iki on 2015/09/07.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import Foundation

public enum LruCacheError: ErrorType {
    case CapacityExceedingError(Int)
}

/**
*  max 10 size LRU Cache
*/
public struct LruCache<K: Hashable, V>: Equatable {
    
    typealias Hash = Dictionary<K, Node<K, V>>
    
    public let capacity: Int
    private var length = 0
    private var store: LinkedDictionary<K, V> = LinkedDictionary()
    private lazy var hashTable: Hash = Hash(minimumCapacity: self.capacity)
    
    public static var maxCapacity: Int {
        return 10
    }
    
    public init() {
        self.capacity = LruCache.maxCapacity
    }
    
    public init(capacity: Int) throws {
        if capacity > LruCache.maxCapacity {
            throw LruCacheError.CapacityExceedingError(capacity)
        }
        self.capacity = capacity
    }
}

// MARK: - Data Operation

extension LruCache {
    
    public subscript(key: K) -> V? {
        mutating get {
            if let node = hashTable[key] {
                update(node)
                return node.value
            } else {
                return nil
            }
        }
        
        set {
            if let node = hashTable[key] {
                node.value = newValue
                update(node) 
            } else {
                let node = Node(key: key, value: newValue)
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
    
    public mutating func removeAll() {
        hashTable.removeAll()
        store.removeAll()
    }
    
    private mutating func save(node: Node<K, V>) {
        store.unshift(node)
        hashTable[node.key] = node
    }
    
    private mutating func update(node: Node<K, V>) {
        store.remove(node)
        store.unshift(node)
    }
    
    private mutating func remove() {
        guard let last = store.tail else {
            return
        }
        hashTable.removeValueForKey(last.key)
        store.tail = last.previous
        store.tail?.next = nil
    }
}

// MARK: - CustomStringConvertible

extension LruCache: CustomStringConvertible {
    public var description: String {
        return "LruCache(\(length)): \n\(store)"
    }
}

// MARK: - Equatable

public func == <K: Hashable, V>(lhs: LruCache<K, V>, rhs: LruCache<K, V>) -> Bool {
    return lhs.capacity == rhs.capacity &&
        lhs.length == rhs.length &&
        lhs.store == rhs.store
}