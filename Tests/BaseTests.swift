//  BaseTests.swift
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

class BaseTests: XCTestCase {
    
    var testData: NSData!
    
    override func setUp() {
        
        super.setUp()
        
        if let file = NSBundle(forClass:BaseTests.self).pathForResource("Tests", ofType: "json") {
            self.testData = NSData(contentsOfFile: file)
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        let json0 = ParsedObject(data:self.testData)
        XCTAssertEqual(json0.array!.count, 3)
        XCTAssertEqual(ParsedObject("123").description, "123")
        XCTAssertEqual(ParsedObject(["1":"2"])["1"].string!, "2")
        var dictionary = NSMutableDictionary()
        dictionary.setObject(NSNumber(double: 1.0), forKey: "number" as NSString)
        dictionary.setObject(NSNull(), forKey: "null" as NSString)
        let json1 = ParsedObject(dictionary)
        if let object: AnyObject = NSJSONSerialization.JSONObjectWithData(self.testData, options: nil, error: nil){
            let json2 = ParsedObject(object)
            XCTAssertEqual(json0, json2)
        }
    }
    
    func testCompare2() {
        let json = ParsedObject("32.1234567890")
    }
    
    func testCompare() {
        XCTAssertNotEqual(ParsedObject("32.1234567890"), ParsedObject(32.1234567890))
        XCTAssertNotEqual(ParsedObject("9876543210987654321"),ParsedObject(NSNumber(unsignedLongLong:9876543210987654321)))
        XCTAssertNotEqual(ParsedObject("9876543210987654321.12345678901234567890"), ParsedObject(9876543210987654321.12345678901234567890))
        XCTAssertEqual(ParsedObject("😊"), ParsedObject("😊"))
        XCTAssertNotEqual(ParsedObject("😱"), ParsedObject("😁"))
        XCTAssertEqual(ParsedObject([123,321,456]), ParsedObject([123,321,456]))
        XCTAssertNotEqual(ParsedObject([123,321,456]), ParsedObject(123456789))
        XCTAssertNotEqual(ParsedObject([123,321,456]), ParsedObject("string"))
        XCTAssertNotEqual(ParsedObject(["1":123,"2":321,"3":456]), ParsedObject("string"))
        XCTAssertEqual(ParsedObject(["1":123,"2":321,"3":456]), ParsedObject(["2":321,"1":123,"3":456]))
        XCTAssertEqual(ParsedObject(NSNull()),ParsedObject(NSNull()))
        XCTAssertNotEqual(ParsedObject(NSNull()), ParsedObject(123))
    }
    
    func testJSONDoesProduceValidWithCorrectKeyPath() {
        let json = ParsedObject(data:self.testData)
        
        let tweets = json
        let tweets_array = json.array
        let tweets_1 = json[1]
        let tweets_array_1 = tweets_1[1]
        let tweets_1_user_name = tweets_1["user"]["name"]
        let tweets_1_user_name_string = tweets_1["user"]["name"].string
        XCTAssertNotEqual(tweets.type, Type.Null)
        XCTAssert(tweets_array != nil)
        XCTAssertNotEqual(tweets_1.type, Type.Null)
        XCTAssertEqual(tweets_1_user_name, ParsedObject("Raffi Krikorian"))
        XCTAssertEqual(tweets_1_user_name_string!, "Raffi Krikorian")
        
        let tweets_1_coordinates = tweets_1["coordinates"]
        let tweets_1_coordinates_coordinates = tweets_1_coordinates["coordinates"]
        let tweets_1_coordinates_coordinates_point_0_double = tweets_1_coordinates_coordinates[0].double
        let tweets_1_coordinates_coordinates_point_1_float = tweets_1_coordinates_coordinates[1].float
        let new_tweets_1_coordinates_coordinates = ParsedObject([-122.25831,37.871609] as NSArray)
        XCTAssertEqual(tweets_1_coordinates_coordinates, new_tweets_1_coordinates_coordinates)
        XCTAssertEqual(tweets_1_coordinates_coordinates_point_0_double!, -122.25831)
        XCTAssertTrue(tweets_1_coordinates_coordinates_point_1_float! == 37.871609)
        let tweets_1_coordinates_coordinates_point_0_string = tweets_1_coordinates_coordinates[0].stringValue
        let tweets_1_coordinates_coordinates_point_1_string = tweets_1_coordinates_coordinates[1].stringValue
        XCTAssertEqual(tweets_1_coordinates_coordinates_point_0_string, "-122.25831")
        XCTAssertEqual(tweets_1_coordinates_coordinates_point_1_string, "37.871609")
        let tweets_1_coordinates_coordinates_point_0 = tweets_1_coordinates_coordinates[0]
        let tweets_1_coordinates_coordinates_point_1 = tweets_1_coordinates_coordinates[1]
        XCTAssertEqual(tweets_1_coordinates_coordinates_point_0, ParsedObject(-122.25831))
        XCTAssertEqual(tweets_1_coordinates_coordinates_point_1, ParsedObject(37.871609))
        
        let created_at = json[0]["created_at"].string
        let id_str = json[0]["id_str"].string
        let favorited = json[0]["favorited"].bool
        let id = json[0]["id"].int
        let in_reply_to_user_id_str = json[0]["in_reply_to_user_id_str"]
        XCTAssertEqual(created_at!, "Tue Aug 28 21:16:23 +0000 2012")
        XCTAssertEqual(id_str!,"240558470661799936")
        XCTAssertFalse(favorited!)
        XCTAssertEqual(id!,240558470661799936)
        XCTAssertEqual(in_reply_to_user_id_str.type, Type.Null)
        
        let user = json[0]["user"]
        let user_name = user["name"].string
        let user_profile_image_url = user["profile_image_url"].URL
        XCTAssert(user_name == "OAuth Dancer")
        XCTAssert(user_profile_image_url == NSURL(string: "http://a0.twimg.com/profile_images/730275945/oauth-dancer_normal.jpg"))
        
        let user_dictionary = json[0]["user"].dictionary
        let user_dictionary_name = user_dictionary?["name"]?.string
        let user_dictionary_name_profile_image_url = user_dictionary?["profile_image_url"]?.URL
        XCTAssert(user_dictionary_name == "OAuth Dancer")
        XCTAssert(user_dictionary_name_profile_image_url == NSURL(string: "http://a0.twimg.com/profile_images/730275945/oauth-dancer_normal.jpg"))
    }
    
    func testSequenceType() {
        let json = ParsedObject(data:self.testData)
        XCTAssertEqual(json.count, 3)
        for (_, aJson) in json {
            XCTAssertEqual(aJson, json[0])
            break
        }
        
        var index = 0
        let keys = (json[1].dictionaryObject! as NSDictionary).allKeys as [String]
        for (aKey, aJson) in json[1] {
            XCTAssertEqual(aKey, keys[index])
            XCTAssertEqual(aJson, json[1][keys[index]])
            break
        }
    }
    
    func testJSONNumberCompare() {
        XCTAssertEqual(ParsedObject(12376352.123321), ParsedObject(12376352.123321))
        XCTAssertGreaterThan(ParsedObject(20.211), ParsedObject(20.112))
        XCTAssertGreaterThanOrEqual(ParsedObject(30.211), ParsedObject(20.112))
        XCTAssertGreaterThanOrEqual(ParsedObject(65232), ParsedObject(65232))
        XCTAssertLessThan(ParsedObject(-82320.211), ParsedObject(20.112))
        XCTAssertLessThanOrEqual(ParsedObject(-320.211), ParsedObject(123.1))
        XCTAssertLessThanOrEqual(ParsedObject(-8763), ParsedObject(-8763))
        
        XCTAssertEqual(ParsedObject(12376352.123321), ParsedObject(12376352.123321))
        XCTAssertGreaterThan(ParsedObject(20.211), ParsedObject(20.112))
        XCTAssertGreaterThanOrEqual(ParsedObject(30.211), ParsedObject(20.112))
        XCTAssertGreaterThanOrEqual(ParsedObject(65232), ParsedObject(65232))
        XCTAssertLessThan(ParsedObject(-82320.211), ParsedObject(20.112))
        XCTAssertLessThanOrEqual(ParsedObject(-320.211), ParsedObject(123.1))
        XCTAssertLessThanOrEqual(ParsedObject(-8763), ParsedObject(-8763))
    }
    
    func testNumberConverToString(){
        XCTAssertEqual(ParsedObject(true).stringValue, "true")
        XCTAssertEqual(ParsedObject(999.9823).stringValue, "999.9823")
        XCTAssertEqual(ParsedObject(true).number!.stringValue, "1")
        XCTAssertEqual(ParsedObject(false).number!.stringValue, "0")
        XCTAssertEqual(ParsedObject("hello").numberValue.stringValue, "0")
        XCTAssertEqual(ParsedObject(NSNull()).numberValue.stringValue, "0")
        XCTAssertEqual(ParsedObject(["a","b","c","d"]).numberValue.stringValue, "0")
        XCTAssertEqual(ParsedObject(["a":"b","c":"d"]).numberValue.stringValue, "0")
    }
    
    func testNumberPrint(){
        
        XCTAssertEqual(ParsedObject(false).description,"false")
        XCTAssertEqual(ParsedObject(true).description,"true")
        
        XCTAssertEqual(ParsedObject(1).description,"1")
        XCTAssertEqual(ParsedObject(22).description,"22")
        #if (arch(x86_64) || arch(arm64))
            XCTAssertEqual(ParsedObject(9.22337203685478E18).description,"9.22337203685478e+18")
            #elseif (arch(i386) || arch(arm))
            XCTAssertEqual(ParsedObject(2147483647).description,"2147483647")
        #endif
        XCTAssertEqual(ParsedObject(-1).description,"-1")
        XCTAssertEqual(ParsedObject(-934834834).description,"-934834834")
        XCTAssertEqual(ParsedObject(-2147483648).description,"-2147483648")
        
        XCTAssertEqual(ParsedObject(1.5555).description,"1.5555")
        XCTAssertEqual(ParsedObject(-9.123456789).description,"-9.123456789")
        XCTAssertEqual(ParsedObject(-0.00000000000000001).description,"-1e-17")
        XCTAssertEqual(ParsedObject(-999999999999999999999999.000000000000000000000001).description,"-1e+24")
        XCTAssertEqual(ParsedObject(-9999999991999999999999999.88888883433343439438493483483943948341).stringValue,"-9.999999991999999e+24")
        
        XCTAssertEqual(ParsedObject(Int(Int.max)).description,"\(Int.max)")
        XCTAssertEqual(ParsedObject(NSNumber(long: Int.min)).description,"\(Int.min)")
        XCTAssertEqual(ParsedObject(NSNumber(unsignedLong: ULONG_MAX)).description,"\(ULONG_MAX)")
        XCTAssertEqual(ParsedObject(NSNumber(unsignedLongLong: UInt64.max)).description,"\(UInt64.max)")
        XCTAssertEqual(ParsedObject(NSNumber(longLong: Int64.max)).description,"\(Int64.max)")
        XCTAssertEqual(ParsedObject(NSNumber(unsignedLongLong: UInt64.max)).description,"\(UInt64.max)")
        
        XCTAssertEqual(ParsedObject(Double.infinity).description,"inf")
        XCTAssertEqual(ParsedObject(-Double.infinity).description,"-inf")
        XCTAssertEqual(ParsedObject(Double.NaN).description,"nan")
        
        XCTAssertEqual(ParsedObject(1.0/0.0).description,"inf")
        XCTAssertEqual(ParsedObject(-1.0/0.0).description,"-inf")
        XCTAssertEqual(ParsedObject(0.0/0.0).description,"nan")
    }
    
    func testNullParsedObject() {
        XCTAssertEqual(ParsedObject(NSNull()).debugDescription,"null")
        
        let json:ParsedObject = nil
        XCTAssertEqual(json.debugDescription,"null")
        XCTAssertNil(json.error)
        let json1:ParsedObject = ParsedObject(NSNull())
        if json1 != nil {
            XCTFail("json1 should be nil")
        }
    }
    
    func testErrorHandle() {
        let json = ParsedObject(data:self.testData)
        if let wrongType = json["wrong-type"].string {
            XCTFail("Should not run into here")
        } else {
            XCTAssertEqual(json["wrong-type"].error!.code, ErrorWrongType)
        }
        
        if let notExist = json[0]["not-exist"].string {
            XCTFail("Should not run into here")
        } else {
            XCTAssertEqual(json[0]["not-exist"].error!.code, ErrorNotExist)
        }
        
        let wrongJSON = ParsedObject(NSObject())
        if let error = wrongJSON.error {
            XCTAssertEqual(error.code, ErrorUnsupportedType)
        }
    }
    
    func testReturnObject() {
        let json = ParsedObject(data:self.testData)
        XCTAssertNotNil(json.object)
    }
    
    func testNumberCompare(){
        XCTAssertEqual(NSNumber(double: 888332), NSNumber(int:888332))
        XCTAssertNotEqual(NSNumber(double: 888332.1), NSNumber(int:888332))
        XCTAssertLessThan(NSNumber(int: 888332), NSNumber(double:888332.1))
        XCTAssertGreaterThan(NSNumber(double: 888332.1), NSNumber(int:888332))
        XCTAssertNotEqual(NSNumber(double: 1), NSNumber(bool:true))
        XCTAssertNotEqual(NSNumber(int: 0), NSNumber(bool:false))
        XCTAssertEqual(NSNumber(bool: false), NSNumber(bool:false))
        XCTAssertEqual(NSNumber(bool: true), NSNumber(bool:true))
    }
    
    
}