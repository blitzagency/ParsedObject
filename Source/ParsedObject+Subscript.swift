//
//  ParsedObject+Subscript.swift
//  FrameworkTest
//
//  Created by Adam Venturella on 11/5/14.
//  Copyright (c) 2014 BLITZ. All rights reserved.
//

import Foundation

// MARK: - Subscript

/**
*  To mark both String and Int can be used in subscript.
*/
public protocol SubscriptType {}

extension Int: SubscriptType {}

extension String: SubscriptType {}

extension ParsedObject {

    /// If `type` is `.Array`, return json which's object is `array[index]`, otherwise return null json with error.
    private subscript(#index: Int) -> ParsedObject {
        get {

            if self.type != .Array {
                var errorResult_ = ParsedObject.nullParsedObject()
                errorResult_._error = self._error ?? NSError(domain: ErrorDomain, code: ErrorWrongType, userInfo: [NSLocalizedDescriptionKey: "Array[\(index)] failure, It is not an array"])
                return errorResult_
            }

            let array_ = self.object as [AnyObject]

            if index >= 0 && index < array_.count {
                return ParsedObject(array_[index])
            }

            var errorResult_ = ParsedObject.nullParsedObject()
            errorResult_._error = NSError(domain: ErrorDomain, code:ErrorIndexOutOfBounds , userInfo: [NSLocalizedDescriptionKey: "Array[\(index)] is out of bounds"])
            return errorResult_
        }
        set {
            if self.type == .Array {
                var array_ = self.object as [AnyObject]
                if array_.count > index {
                    array_[index] = newValue.object
                    self.object = array_
                }
            }
        }
    }

    /// If `type` is `.Dictionary`, return json which's object is `dictionary[key]` , otherwise return null json with error.
    private subscript(#key: String) -> ParsedObject {
        get {
            var returnJSON = ParsedObject.nullParsedObject()
            if self.type == .Dictionary {
                if let object_: AnyObject = self.object[key] {
                    returnJSON = ParsedObject(object_)
                } else {
                    returnJSON._error = NSError(domain: ErrorDomain, code: ErrorNotExist, userInfo: [NSLocalizedDescriptionKey: "Dictionary[\"\(key)\"] does not exist"])
                }
            } else {
                returnJSON._error = self._error ?? NSError(domain: ErrorDomain, code: ErrorWrongType, userInfo: [NSLocalizedDescriptionKey: "Dictionary[\"\(key)\"] failure, It is not an dictionary"])
            }
            return returnJSON
        }
        set {
            if self.type == .Dictionary {
                var dictionary_ = self.object as [String : AnyObject]
                dictionary_[key] = newValue.object
                self.object = dictionary_
            }
        }
    }

    /// If `sub` is `Int`, return `subscript(index:)`; If `sub` is `String`,  return `subscript(key:)`.
    private subscript(#sub: SubscriptType) -> ParsedObject {
        get {
            if sub is String {
                return self[key:sub as String]
            } else {
                return self[index:sub as Int]
            }
        }
        set {
            if sub is String {
                self[key:sub as String] = newValue
            } else {
                self[index:sub as Int] = newValue
            }
        }
    }

    /**
    Find a json in the complex data structuresby using the Int/String's array.

    :param: path The target json's path. Example:

    let json = JSON[data]
    let path = [9,"list","person","name"]
    let name = json[path]

    The same as: let name = json[9]["list"]["person"]["name"]

    :returns: Return a json found by the path or a null json with error
    */
    public subscript(path: [SubscriptType]) -> ParsedObject {
        get {
            if path.count == 0 {
                return ParsedObject.nullParsedObject()
            }

            var next = self
            for sub in path {
                next = next[sub:sub]
            }
            return next
        }
        set {

            switch path.count {
            case 0: return
            case 1: self[sub:path[0]] = newValue
            default:
                var last = newValue
                var newPath = path
                newPath.removeLast()
                for sub in path.reverse() {
                    var previousLast = self[newPath]
                    previousLast[sub:sub] = last
                    last = previousLast
                    if newPath.count <= 1 {
                        break
                    }
                    newPath.removeLast()
                }
                self[sub:newPath[0]] = last
            }
        }
    }

    /**
    Find a json in the complex data structuresby using the Int/String's array.

    :param: path The target json's path. Example:

    let name = json[9,"list","person","name"]

    The same as: let name = json[9]["list"]["person"]["name"]

    :returns: Return a json found by the path or a null json with error
    */
    public subscript(path: SubscriptType...) -> ParsedObject {
        get {
            return self[path]
        }
        set {
            self[path] = newValue
        }
    }
}
