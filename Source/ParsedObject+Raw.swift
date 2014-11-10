//
//  ParsedObject+Raw.swift
//  FrameworkTest
//
//  Created by Adam Venturella on 11/5/14.
//  Copyright (c) 2014 BLITZ. All rights reserved.
//

import Foundation


// MARK: - Raw

extension ParsedObject: RawRepresentable {

    public convenience init?(rawValue: AnyObject) {
        self.init(rawValue)
        
        if ParsedObject(rawValue).type == Type.Unknow {
            return nil
        }
    }

    public var rawValue: AnyObject {
        return self.object
    }

    public func rawData(options opt: NSJSONWritingOptions = NSJSONWritingOptions(0), error: NSErrorPointer = nil) -> NSData? {
        return NSJSONSerialization.dataWithJSONObject(self.object, options: opt, error:error)
    }

    public func rawString(encoding: UInt = NSUTF8StringEncoding, options opt: NSJSONWritingOptions = .PrettyPrinted) -> String? {
        switch self.type {
        case .Array, .Dictionary:
            if let data = self.rawData(options: opt) {
                return NSString(data: data, encoding: encoding)
            } else {
                return nil
            }
        case .String:
            return (self.object as String)
        case .Number:
            return (self.object as NSNumber).stringValue
        case .Bool:
            return (self.object as Bool).description
        case .Null:
            return "null"
        default:
            return nil
        }
    }
}
