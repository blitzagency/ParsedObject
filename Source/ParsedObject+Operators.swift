//
//  ParsedObject+Operators.swift
//  FrameworkTest
//
//  Created by Adam Venturella on 11/5/14.
//  Copyright (c) 2014 BLITZ. All rights reserved.
//

import Foundation

//MARK: - Comparable
extension ParsedObject: Comparable {}

public func ==(lhs: ParsedObject, rhs: ParsedObject) -> Bool {

    switch (lhs.type, rhs.type) {
    case (.Number, .Number):
        return (lhs.object as NSNumber) == (rhs.object as NSNumber)
    case (.String, .String):
        return (lhs.object as String) == (rhs.object as String)
    case (.Bool, .Bool):
        return (lhs.object as Bool) == (rhs.object as Bool)
    case (.Array, .Array):
        return (lhs.object as NSArray) == (rhs.object as NSArray)
    case (.Dictionary, .Dictionary):
        return (lhs.object as NSDictionary) == (rhs.object as NSDictionary)
    case (.Null, .Null):
        return true
    default:
        return false
    }
}

public func <=(lhs: ParsedObject, rhs: ParsedObject) -> Bool {

    switch (lhs.type, rhs.type) {
    case (.Number, .Number):
        return (lhs.object as NSNumber) <= (rhs.object as NSNumber)
    case (.String, .String):
        return (lhs.object as String) <= (rhs.object as String)
    case (.Bool, .Bool):
        return (lhs.object as Bool) == (rhs.object as Bool)
    case (.Array, .Array):
        return (lhs.object as NSArray) == (rhs.object as NSArray)
    case (.Dictionary, .Dictionary):
        return (lhs.object as NSDictionary) == (rhs.object as NSDictionary)
    case (.Null, .Null):
        return true
    default:
        return false
    }
}

public func >=(lhs: ParsedObject, rhs: ParsedObject) -> Bool {

    switch (lhs.type, rhs.type) {
    case (.Number, .Number):
        return (lhs.object as NSNumber) >= (rhs.object as NSNumber)
    case (.String, .String):
        return (lhs.object as String) >= (rhs.object as String)
    case (.Bool, .Bool):
        return (lhs.object as Bool) == (rhs.object as Bool)
    case (.Array, .Array):
        return (lhs.object as NSArray) == (rhs.object as NSArray)
    case (.Dictionary, .Dictionary):
        return (lhs.object as NSDictionary) == (rhs.object as NSDictionary)
    case (.Null, .Null):
        return true
    default:
        return false
    }
}

public func >(lhs: ParsedObject, rhs: ParsedObject) -> Bool {

    switch (lhs.type, rhs.type) {
    case (.Number, .Number):
        return (lhs.object as NSNumber) > (rhs.object as NSNumber)
    case (.String, .String):
        return (lhs.object as String) > (rhs.object as String)
    default:
        return false
    }
}

public func <(lhs: ParsedObject, rhs: ParsedObject) -> Bool {

    switch (lhs.type, rhs.type) {
    case (.Number, .Number):
        return (lhs.object as NSNumber) < (rhs.object as NSNumber)
    case (.String, .String):
        return (lhs.object as String) < (rhs.object as String)
    default:
        return false
    }
}
