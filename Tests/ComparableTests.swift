//  ComparableTests.swift
//
//  Copyright (c) 2014 Ruoyu Fu, Pinglin Tang
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

class ComparableTests: XCTestCase {

    func testNumberEqual() {
        var jsonL1:ParsedObject = 1234567890.876623
        var jsonR1:ParsedObject = ParsedObject(1234567890.876623)
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 == 1234567890.876623)

        var jsonL2:ParsedObject = 987654321
        var jsonR2:ParsedObject = ParsedObject(987654321)
        XCTAssertEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonR2 == 987654321)

        
        var jsonL3:ParsedObject = ParsedObject(NSNumber(double:87654321.12345678))
        var jsonR3:ParsedObject = ParsedObject(NSNumber(double:87654321.12345678))
        XCTAssertEqual(jsonL3, jsonR3)
        XCTAssertTrue(jsonR3 == 87654321.12345678)
    }
    
    func testNumberNotEqual() {
        var jsonL1:ParsedObject = 1234567890.876623
        var jsonR1:ParsedObject = ParsedObject(123.123)
        XCTAssertNotEqual(jsonL1, jsonR1)
        XCTAssertFalse(jsonL1 == 34343)
        
        var jsonL2:ParsedObject = 8773
        var jsonR2:ParsedObject = ParsedObject(123.23)
        XCTAssertNotEqual(jsonL2, jsonR2)
        XCTAssertFalse(jsonR1 == 454352)
        
        var jsonL3:ParsedObject = ParsedObject(NSNumber(double:87621.12345678))
        var jsonR3:ParsedObject = ParsedObject(NSNumber(double:87654321.45678))
        XCTAssertNotEqual(jsonL3, jsonR3)
        XCTAssertFalse(jsonL3 == 4545.232)
    }
    
    func testNumberGreaterThanOrEqual() {
        var jsonL1:ParsedObject = 1234567890.876623
        var jsonR1:ParsedObject = ParsedObject(123.123)
        XCTAssertGreaterThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 >= -37434)
        
        var jsonL2:ParsedObject = 8773
        var jsonR2:ParsedObject = ParsedObject(-87343)
        XCTAssertGreaterThanOrEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonR2 >= -988343)

        var jsonL3:ParsedObject = ParsedObject(NSNumber(double:87621.12345678))
        var jsonR3:ParsedObject = ParsedObject(NSNumber(double:87621.12345678))
        XCTAssertGreaterThanOrEqual(jsonL3, jsonR3)
        XCTAssertTrue(jsonR3 >= 0.3232)
    }
    
    func testNumberLessThanOrEqual() {
        var jsonL1:ParsedObject = 1234567890.876623
        var jsonR1:ParsedObject = ParsedObject(123.123)
        XCTAssertLessThanOrEqual(jsonR1, jsonL1)
        XCTAssertFalse(83487343.3493 <= jsonR1)
        
        var jsonL2:ParsedObject = 8773
        var jsonR2:ParsedObject = ParsedObject(-123.23)
        XCTAssertLessThanOrEqual(jsonR2, jsonL2)
        XCTAssertFalse(9348343 <= jsonR2)
        
        var jsonL3:ParsedObject = ParsedObject(NSNumber(double:87621.12345678))
        var jsonR3:ParsedObject = ParsedObject(NSNumber(double:87621.12345678))
        XCTAssertLessThanOrEqual(jsonR3, jsonL3)
        XCTAssertTrue(87621.12345678 <= jsonR3)
    }

    func testNumberGreaterThan() {
        var jsonL1:ParsedObject = 1234567890.876623
        var jsonR1:ParsedObject = ParsedObject(123.123)
        XCTAssertGreaterThan(jsonL1, jsonR1)
        XCTAssertFalse(jsonR1 > 192388843.0988)

        var jsonL2:ParsedObject = 8773
        var jsonR2:ParsedObject = ParsedObject(123.23)
        XCTAssertGreaterThan(jsonL2, jsonR2)
        XCTAssertFalse(jsonR2 > 877434)

        var jsonL3:ParsedObject = ParsedObject(NSNumber(double:87621.12345678))
        var jsonR3:ParsedObject = ParsedObject(NSNumber(double:87621.1234567))
        XCTAssertGreaterThan(jsonL3, jsonR3)
        XCTAssertFalse(-7799 > jsonR3)
    }
    
    func testNumberLessThan() {
        var jsonL1:ParsedObject = 1234567890.876623
        var jsonR1:ParsedObject = ParsedObject(123.123)
        XCTAssertLessThan(jsonR1, jsonL1)
        XCTAssertTrue(jsonR1 < 192388843.0988)

        var jsonL2:ParsedObject = 8773
        var jsonR2:ParsedObject = ParsedObject(123.23)
        XCTAssertLessThan(jsonR2, jsonL2)
        XCTAssertTrue(jsonR2 < 877434)
        
        var jsonL3:ParsedObject = ParsedObject(NSNumber(double:87621.12345678))
        var jsonR3:ParsedObject = ParsedObject(NSNumber(double:87621.1234567))
        XCTAssertLessThan(jsonR3, jsonL3)
        XCTAssertTrue(-7799 < jsonR3)
    }

    func testBoolEqual() {
        var jsonL1:ParsedObject = true
        var jsonR1:ParsedObject = ParsedObject(true)
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 == true)

        var jsonL2:ParsedObject = false
        var jsonR2:ParsedObject = ParsedObject(false)
        XCTAssertEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonL2 == false)
    }
    
    func testBoolNotEqual() {
        var jsonL1:ParsedObject = true
        var jsonR1:ParsedObject = ParsedObject(false)
        XCTAssertNotEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 != false)

        var jsonL2:ParsedObject = false
        var jsonR2:ParsedObject = ParsedObject(true)
        XCTAssertNotEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonL2 != true)
    }
    
    func testBoolGreaterThanOrEqual() {
        var jsonL1:ParsedObject = true
        var jsonR1:ParsedObject = ParsedObject(true)
        XCTAssertGreaterThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 >= true)
        
        var jsonL2:ParsedObject = false
        var jsonR2:ParsedObject = ParsedObject(false)
        XCTAssertGreaterThanOrEqual(jsonL2, jsonR2)
        XCTAssertFalse(jsonL2 >= true)
    }
    
    func testBoolLessThanOrEqual() {
        var jsonL1:ParsedObject = true
        var jsonR1:ParsedObject = ParsedObject(true)
        XCTAssertLessThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(true <= jsonR1)
        
        var jsonL2:ParsedObject = false
        var jsonR2:ParsedObject = ParsedObject(false)
        XCTAssertLessThanOrEqual(jsonL2, jsonR2)
        XCTAssertFalse(jsonL2 <= true)
    }
    
    func testBoolGreaterThan() {
        var jsonL1:ParsedObject = true
        var jsonR1:ParsedObject = ParsedObject(true)
        XCTAssertFalse(jsonL1 > jsonR1)
        XCTAssertFalse(jsonL1 > true)
        XCTAssertFalse(jsonR1 > false)

        var jsonL2:ParsedObject = false
        var jsonR2:ParsedObject = ParsedObject(false)
        XCTAssertFalse(jsonL2 > jsonR2)
        XCTAssertFalse(jsonL2 > false)
        XCTAssertFalse(jsonR2 > true)

        var jsonL3:ParsedObject = true
        var jsonR3:ParsedObject = ParsedObject(false)
        XCTAssertFalse(jsonL3 > jsonR3)
        XCTAssertFalse(jsonL3 > false)
        XCTAssertFalse(jsonR3 > true)
        
        var jsonL4:ParsedObject = false
        var jsonR4:ParsedObject = ParsedObject(true)
        XCTAssertFalse(jsonL4 > jsonR4)
        XCTAssertFalse(jsonL4 > false)
        XCTAssertFalse(jsonR4 > true)
    }
    
    func testBoolLessThan() {
        var jsonL1:ParsedObject = true
        var jsonR1:ParsedObject = ParsedObject(true)
        XCTAssertFalse(jsonL1 < jsonR1)
        XCTAssertFalse(jsonL1 < true)
        XCTAssertFalse(jsonR1 < false)

        var jsonL2:ParsedObject = false
        var jsonR2:ParsedObject = ParsedObject(false)
        XCTAssertFalse(jsonL2 < jsonR2)
        XCTAssertFalse(jsonL2 < false)
        XCTAssertFalse(jsonR2 < true)
        
        var jsonL3:ParsedObject = true
        var jsonR3:ParsedObject = ParsedObject(false)
        XCTAssertFalse(jsonL3 < jsonR3)
        XCTAssertFalse(jsonL3 < false)
        XCTAssertFalse(jsonR3 < true)

        var jsonL4:ParsedObject = false
        var jsonR4:ParsedObject = ParsedObject(true)
        XCTAssertFalse(jsonL4 < jsonR4)
        XCTAssertFalse(jsonL4 < false)
        XCTAssertFalse(true < jsonR4)
    }
    
    func testStringEqual() {
        var jsonL1:ParsedObject = "abcdefg 123456789 !@#$%^&*()"
        var jsonR1:ParsedObject = ParsedObject("abcdefg 123456789 !@#$%^&*()")

        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 == "abcdefg 123456789 !@#$%^&*()")
    }
    
    func testStringNotEqual() {
        var jsonL1:ParsedObject = "abcdefg 123456789 !@#$%^&*()"
        var jsonR1:ParsedObject = ParsedObject("-=[]\\\"987654321")
        
        XCTAssertNotEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 != "not equal")
    }
    
    func testStringGreaterThanOrEqual() {
        var jsonL1:ParsedObject = "abcdefg 123456789 !@#$%^&*()"
        var jsonR1:ParsedObject = ParsedObject("abcdefg 123456789 !@#$%^&*()")
        
        XCTAssertGreaterThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 >= "abcdefg 123456789 !@#$%^&*()")

        var jsonL2:ParsedObject = "z-+{}:"
        var jsonR2:ParsedObject = ParsedObject("a<>?:")
        XCTAssertGreaterThanOrEqual(jsonL2, jsonR2)
        XCTAssertTrue(jsonL2 >= "mnbvcxz")
    }
    
    func testStringLessThanOrEqual() {
        var jsonL1:ParsedObject = "abcdefg 123456789 !@#$%^&*()"
        var jsonR1:ParsedObject = ParsedObject("abcdefg 123456789 !@#$%^&*()")
        
        XCTAssertLessThanOrEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 <= "abcdefg 123456789 !@#$%^&*()")
        
        var jsonL2:ParsedObject = "z-+{}:"
        var jsonR2:ParsedObject = ParsedObject("a<>?:")
        XCTAssertLessThanOrEqual(jsonR2, jsonL2)
        XCTAssertTrue("mnbvcxz" <= jsonL2)
    }
    
    func testStringGreaterThan() {
        var jsonL1:ParsedObject = "abcdefg 123456789 !@#$%^&*()"
        var jsonR1:ParsedObject = ParsedObject("abcdefg 123456789 !@#$%^&*()")
        
        XCTAssertFalse(jsonL1 > jsonR1)
        XCTAssertFalse(jsonL1 > "abcdefg 123456789 !@#$%^&*()")
        
        var jsonL2:ParsedObject = "z-+{}:"
        var jsonR2:ParsedObject = ParsedObject("a<>?:")
        XCTAssertGreaterThan(jsonL2, jsonR2)
        XCTAssertFalse("87663434" > jsonL2)
    }

    func testStringLessThan() {
        var jsonL1:ParsedObject = "abcdefg 123456789 !@#$%^&*()"
        var jsonR1:ParsedObject = ParsedObject("abcdefg 123456789 !@#$%^&*()")
        
        XCTAssertFalse(jsonL1 < jsonR1)
        XCTAssertFalse(jsonL1 < "abcdefg 123456789 !@#$%^&*()")
        
        var jsonL2:ParsedObject = "98774"
        var jsonR2:ParsedObject = ParsedObject("123456")
        XCTAssertLessThan(jsonR2, jsonL2)
        XCTAssertFalse(jsonL2 < "09")
    }

    func testNil() {
        var jsonL1:ParsedObject = nil
        var jsonR1:ParsedObject = ParsedObject(NSNull())
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 != "123")
        XCTAssertFalse(jsonL1 > "abcd")
        XCTAssertFalse(jsonR1 < "*&^")
        XCTAssertFalse(jsonL1 >= "jhfid")
        XCTAssertFalse(jsonR1 <= "你好")
        XCTAssertTrue(jsonL1 >= jsonR1)
        XCTAssertTrue(jsonL1 <= jsonR1)
    }
    
    func testArray() {
        var jsonL1:ParsedObject = [1,2,"4",5,"6"]
        var jsonR1:ParsedObject = ParsedObject([1,2,"4",5,"6"])
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 == [1,2,"4",5,"6"])
        XCTAssertTrue(jsonL1 != ["abcd","efg"])
        XCTAssertTrue(jsonL1 >= jsonR1)
        XCTAssertTrue(jsonL1 <= jsonR1)
        XCTAssertFalse(jsonL1 > ["abcd",""])
        XCTAssertFalse(jsonR1 < [])
        XCTAssertFalse(jsonL1 >= [:])
    }
    
    func testDictionary() {
        var jsonL1:ParsedObject = ["2": 2, "name": "Jack", "List": ["a", 1.09, NSNull()]]
        var jsonR1:ParsedObject = ParsedObject(["2": 2, "name": "Jack", "List": ["a", 1.09, NSNull()]])
        
        XCTAssertEqual(jsonL1, jsonR1)
        XCTAssertTrue(jsonL1 != ["1":2,"Hello":"World","Koo":"Foo"])
        XCTAssertTrue(jsonL1 >= jsonR1)
        XCTAssertTrue(jsonL1 <= jsonR1)
        XCTAssertFalse(jsonL1 >= [:])
        XCTAssertFalse(jsonR1 <= ["999":"aaaa"])
        XCTAssertFalse(jsonL1 > [")(*&^":1234567])
        XCTAssertFalse(jsonR1 < ["MNHH":"JUYTR"])
    }
}