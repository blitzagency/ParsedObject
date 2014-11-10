//
//  ParsedObject+Convertables.swift
//  FrameworkTest
//
//  Created by Adam Venturella on 11/5/14.
//  Copyright (c) 2014 BLITZ. All rights reserved.
//

import Foundation


// MARK: - LiteralConvertible

extension ParsedObject: StringLiteralConvertible {

    public convenience init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }

    public convenience init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self.init(value)
    }

    public convenience init(unicodeScalarLiteral value: StringLiteralType) {
        self.init(value)
    }
}

extension ParsedObject: IntegerLiteralConvertible {

    public convenience init(integerLiteral value: IntegerLiteralType) {
        self.init(value)
    }
}

extension ParsedObject: BooleanLiteralConvertible {

    public convenience init(booleanLiteral value: BooleanLiteralType) {
        self.init(value)
    }
}

extension ParsedObject: FloatLiteralConvertible {

    public convenience init(floatLiteral value: FloatLiteralType) {
        self.init(value)
    }
}

extension ParsedObject: DictionaryLiteralConvertible {

    public convenience init(dictionaryLiteral elements: (String, AnyObject)...) {
        var dictionary_ = [String : AnyObject]()
        for (key_, value) in elements {
            dictionary_[key_] = value
        }
        self.init(dictionary_)
    }
}

extension ParsedObject: ArrayLiteralConvertible {

    public convenience init(arrayLiteral elements: AnyObject...) {
        self.init(elements)
    }
}

extension ParsedObject: NilLiteralConvertible {

    public convenience init(nilLiteral: ()) {
        self.init(NSNull())
    }
}
