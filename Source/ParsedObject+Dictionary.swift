//
//  ParsedObject+Dictionary.swift
//  FrameworkTest
//
//  Created by Adam Venturella on 11/5/14.
//  Copyright (c) 2014 BLITZ. All rights reserved.
//

import Foundation

// MARK: - Dictionary

extension ParsedObject {

    private func _map<Key:Hashable ,Value, NewValue>(source: [Key: Value], transform: Value -> NewValue) -> [Key: NewValue] {
        var result = [Key: NewValue](minimumCapacity:source.count)
        for (key,value) in source {
            result[key] = transform(value)
        }
        return result
    }

    //Optional [String : JSON]
    public var dictionary: [String : ParsedObject]? {
        get {
            if self.type == .Dictionary {
                return _map(self.object as [String : AnyObject]){ ParsedObject($0) }
            } else {
                return nil
            }
        }
    }

    //Non-optional [String : JSON]
    public var dictionaryValue: [String : ParsedObject] {
        get {
            return self.dictionary ?? [:]
        }
    }

    //Optional [String : AnyObject]
    public var dictionaryObject: [String : AnyObject]? {
        get {
            switch self.type {
            case .Dictionary:
                return self.object as? [String : AnyObject]
            default:
                return nil
            }
        }
        set {
            if newValue != nil {
                self.object = NSMutableDictionary(dictionary: newValue!, copyItems: true)
            } else {
                self.object = NSNull()
            }
        }
    }
}
