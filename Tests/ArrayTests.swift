//  ArrayTests.swift
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

class ArrayTests: XCTestCase {

    func testSingleDimensionalArraysGetter() {
        let array = ["1","2", "a", "B", "D"]
        let obj = ParsedObject(array)
        XCTAssertEqual((obj.array![0] as ParsedObject).string!, "1")
        XCTAssertEqual((obj.array![1] as ParsedObject).string!, "2")
        XCTAssertEqual((obj.array![2] as ParsedObject).string!, "a")
        XCTAssertEqual((obj.array![3] as ParsedObject).string!, "B")
        XCTAssertEqual((obj.array![4] as ParsedObject).string!, "D")
    }

    func testSingleDimensionalArraysSetter() {
        let array = ["1","2", "a", "B", "D"]
        var obj = ParsedObject(array)
        obj.arrayObject = ["111", "222"]
        XCTAssertEqual((obj.array![0] as ParsedObject).string!, "111")
        XCTAssertEqual((obj.array![1] as ParsedObject).string!, "222")
    }
}
