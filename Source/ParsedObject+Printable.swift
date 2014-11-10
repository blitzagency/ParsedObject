//
//  ParsedObject+Printable.swift
//  FrameworkTest
//
//  Created by Adam Venturella on 11/5/14.
//  Copyright (c) 2014 BLITZ. All rights reserved.
//

import Foundation

// MARK: - Printable, DebugPrintable

extension ParsedObject: Printable, DebugPrintable {

    public override var description: String {
        if let string = self.rawString(options:.PrettyPrinted) {
            return string
        } else {
            return "unknown"
        }
    }

    public override var debugDescription: String {
        return description
    }
}