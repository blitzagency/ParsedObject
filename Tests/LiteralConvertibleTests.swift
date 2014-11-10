//  LiteralConvertibleTests.swift
//
//  Copyright (c) 2014 Pinglin Tang
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import XCTest
import ParsedObject

class LiteralConvertibleTests: XCTestCase {
    
    func testNumber() {
        var json:ParsedObject = 1234567890.876623
        XCTAssertEqual(json.int!, 1234567890)
        XCTAssertEqual(json.intValue, 1234567890)
        XCTAssertEqual(json.double!, 1234567890.876623)
        XCTAssertEqual(json.doubleValue, 1234567890.876623)
        XCTAssertTrue(json.float! == 1234567890.876623)
        XCTAssertTrue(json.floatValue == 1234567890.876623)
    }
    
    func testBool() {
        var jsonTrue:ParsedObject = true
        XCTAssertEqual(jsonTrue.bool!, true)
        XCTAssertEqual(jsonTrue.boolValue, true)
        var jsonFalse:ParsedObject = false
        XCTAssertEqual(jsonFalse.bool!, false)
        XCTAssertEqual(jsonFalse.boolValue, false)
    }
    
    func testString() {
        var json:ParsedObject = "abcd efg, HIJK;LMn"
        XCTAssertEqual(json.string!, "abcd efg, HIJK;LMn")
        XCTAssertEqual(json.stringValue, "abcd efg, HIJK;LMn")
    }
    
    func testNil() {
        var jsonNil_1:ParsedObject = nil
        XCTAssert(jsonNil_1 == nil)
        var jsonNil_2:ParsedObject = ParsedObject(NSNull)
        XCTAssert(jsonNil_2 != nil)
        var jsonNil_3:ParsedObject = ParsedObject([1:2])
        XCTAssert(jsonNil_3 != nil)
    }
    
    func testArray() {
        var json:ParsedObject = [1,2,"4",5,"6"]
        XCTAssertEqual(json.array!, [1,2,"4",5,"6"])
        XCTAssertEqual(json.arrayValue, [1,2,"4",5,"6"])
    }
    
    func testDictionary() {
        var json:ParsedObject = ["1":2,"2":2,"three":3,"list":["aa","bb","dd"]]
        XCTAssertEqual(json.dictionary!, ["1":2,"2":2,"three":3,"list":["aa","bb","dd"]])
        XCTAssertEqual(json.dictionaryValue, ["1":2,"2":2,"three":3,"list":["aa","bb","dd"]])
    }
}