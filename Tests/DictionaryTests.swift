//  DictionaryTests.swift
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

class DictionaryTests: XCTestCase {
    
    func testGetter() {
        let dictionary = ["number":9823.212, "name":"NAME", "list":[1234, 4.212], "object":["sub_number":877.2323, "sub_name":"sub_name"], "bool":true]
        let json = ParsedObject(dictionary)
        //dictionary
        XCTAssertEqual((json.dictionary!["number"]! as ParsedObject).double!, 9823.212)
        XCTAssertEqual((json.dictionary!["name"]! as ParsedObject).string!, "NAME")
        XCTAssertEqual(((json.dictionary!["list"]! as ParsedObject).array![0] as ParsedObject).int!, 1234)
        XCTAssertEqual(((json.dictionary!["list"]! as ParsedObject).array![1] as ParsedObject).double!, 4.212)
        XCTAssertEqual((((json.dictionary!["object"]! as ParsedObject).dictionaryValue)["sub_number"]! as ParsedObject).double!, 877.2323)
        XCTAssertTrue(json.dictionary!["null"] == nil)
        //dictionaryValue
        XCTAssertEqual(((((json.dictionaryValue)["object"]! as ParsedObject).dictionaryValue)["sub_name"]! as ParsedObject).string!, "sub_name")
        XCTAssertEqual((json.dictionaryValue["bool"]! as ParsedObject).bool!, true)
        XCTAssertTrue(json.dictionaryValue["null"] == nil)
        XCTAssertTrue(ParsedObject.nullParsedObject().dictionaryValue == [:])
        //dictionaryObject
        XCTAssertEqual(json.dictionaryObject!["number"]! as Double, 9823.212)
        XCTAssertTrue(json.dictionaryObject!["null"] == nil)
        XCTAssertTrue(ParsedObject.nullParsedObject().dictionaryObject == nil)
    }
    
    func testSetter() {
        var json:ParsedObject = ["test":"case"]
        XCTAssertEqual(json.dictionaryObject! as [String : String], ["test":"case"])
        json.dictionaryObject = ["name":"NAME"]
        XCTAssertEqual(json.dictionaryObject! as [String : String], ["name":"NAME"])
    }
}