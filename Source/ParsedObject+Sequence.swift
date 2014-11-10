//
//  ParsedObject+Sequence.swift
//  FrameworkTest
//
//  Created by Adam Venturella on 11/5/14.
//  Copyright (c) 2014 BLITZ. All rights reserved.
//

import Foundation

// MARK: - SequenceType
extension ParsedObject: SequenceType{
    
    /// If `type` is `.Array` or `.Dictionary`, return `array.empty` or `dictonary.empty` otherwise return `false`.
    var isEmpty: Bool {
        get {
            switch self.type {
            case .Array:
                return (self.object as [AnyObject]).isEmpty
            case .Dictionary:
                return (self.object as [String : AnyObject]).isEmpty
            default:
                return false
            }
        }
    }
    
    /// If `type` is `.Array` or `.Dictionary`, return `array.count` or `dictonary.count` otherwise return `0`.
    public var count: Int {
        get {
            switch self.type {
            case .Array:
                return self.arrayValue.count
            case .Dictionary:
                return self.dictionaryValue.count
            default:
                return 0
            }
        }
    }
    
    /**
    If `type` is `.Array` or `.Dictionary`, return a generator over the elements like `Array` or `Dictionary, otherwise return a generator over empty.
    
    :returns: Return a *generator* over the elements of this *sequence*.
    */
    public func generate() -> GeneratorOf <(String, ParsedObject)> {
        switch self.type {
        case .Array:
            let array_ = object as [AnyObject]
            var generate_ = array_.generate()
            var index_: Int = 0
            return GeneratorOf<(String, ParsedObject)> {
                if let element_: AnyObject = generate_.next() {
                    return ("\(index_++)", ParsedObject(element_))
                } else {
                    return nil
                }
            }
        case .Dictionary:
            let dictionary_ = object as [String : AnyObject]
            var generate_ = dictionary_.generate()
            return GeneratorOf<(String, ParsedObject)> {
                if let (key_: String, value_: AnyObject) = generate_.next() {
                    return (key_, ParsedObject(value_))
                } else {
                    return nil
                }
            }
        default:
            return GeneratorOf<(String, ParsedObject)> {
                return nil
            }
        }
    }
}