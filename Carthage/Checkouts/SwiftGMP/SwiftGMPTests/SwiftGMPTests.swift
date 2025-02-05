//
//  SwiftGMPTests.swift
//  SwiftGMPTests
//
//  Created by Teo on 21/05/15.
//  Copyright (c) 2015 Teo. All rights reserved.
//

//import Cocoa

import XCTest
import SwiftGMP

class SwiftGMPTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDoubleOperators() {
        //The operator functions use the cmp function
        
        let two = SwiftGMP.GMPDouble(2.0)
        let eight = SwiftGMP.GMPDouble(8.0)
        let ten = SwiftGMP.GMPDouble(10.0)
        let five = SwiftGMP.GMPDouble(5.0)
        let twelve = SwiftGMP.GMPDouble(12.0)
        let twenty = SwiftGMP.GMPDouble(20.0)

        XCTAssert((ten-two) == 8.0, "10-2=8")
        XCTAssert((ten-two) == eight, "10-2=8")
        XCTAssert((ten+two) == 12.0, "10+2=12")
        XCTAssert((ten+two) == twelve, "10+2=12")
        XCTAssert((ten/two) == 5.0, "10/2=5")
        XCTAssert((ten/two) == five, "10/2=5")
        XCTAssert((ten*two) == 20.0, "10*2=20")
        XCTAssert((ten*two) == twenty, "10*2=20")
        XCTAssert(ten > 2.0, "10>2")
        XCTAssert(ten > two, "10>2")
        XCTAssert(2.0 < 10, "2<10")
        XCTAssert(two < ten, "2<10")
        XCTAssert(ten != two, "10!=2")
        XCTAssert(ten == 10.0, "10=10")
        XCTAssert(ten == ten, "10=10")
        XCTAssert(ten >= 10.0, "10>=10")
        XCTAssert(ten >= 5.0, "10>=5")
        XCTAssert(ten >= five, "10>=5")
    }
    
    func testDouble() {
        print("Default precision: " + String(SwiftGMP.GMPDouble.defaultPrecision))
        let dmax64 = SwiftGMP.GMPDouble(.greatestFiniteMagnitude)
        print("DBL_MAX @ default prec: " + dmax64.description)
        SwiftGMP.GMPDouble.defaultPrecision = 128
        let dmax128 = SwiftGMP.GMPDouble(.greatestFiniteMagnitude)
        print("DBL_MAX @ 128 prec: " + dmax128.description)
        
        let twoDmax = dmax64 + dmax128
        print("DBL_MAX * 2 @ 128 prec" + twoDmax.description)
    
        print("Test zero \(SwiftGMP.GMPDouble(-0))")
        XCTAssert(SwiftGMP.GMPDouble(0).description == Double(0).description, "zero should equal zero")
        
        print("Test small number \(SwiftGMP.GMPDouble(0.00001))")
        print("Test small number \(SwiftGMP.GMPDouble(-0.00001))")
        print("Test small number \(SwiftGMP.GMPDouble(-0.1))")
        let a = SwiftGMP.GMPDouble("12334525234523452354.134534534")
        let b = SwiftGMP.GMPDouble(12341.8233)
        let c = SwiftGMP.GMPDouble(100.00)
        let d = SwiftGMP.GMPDouble(-10.00)
        let e = SwiftGMP.GMPDouble(-1.002)
        print((d + 1.0).description)
        print("a: \(SwiftGMP.GMPDouble.string(a))")
        print("b: \(SwiftGMP.GMPDouble.string(b))")
        print("c: \(SwiftGMP.GMPDouble.string(c))")
        print("d: \(SwiftGMP.GMPDouble.string(d))")
        print("e: \(SwiftGMP.GMPDouble.string(e))")
        
        XCTAssert(c.isInteger() != 0, "c is an integer")
        XCTAssert(d.isInteger() != 0, "d is an integer")
        
        let f = SwiftGMP.GMPDouble(10.6)
        let g = SwiftGMP.GMPDouble(2.1)
        
        print("f: \(SwiftGMP.GMPDouble.string(f))")
        print("g: \(SwiftGMP.GMPDouble.string(g))")
        
        testDoubleOperators()
        
        let i = SwiftGMP.GMPDouble.add(f, g)
        print("i (f+g): \(SwiftGMP.GMPDouble.string(i)) " + SwiftGMP.GMPDouble.string(f+g))
        
        let j = SwiftGMP.GMPDouble.sub(f, g)
        print("j (f+g): \(SwiftGMP.GMPDouble.string(j)) " + SwiftGMP.GMPDouble.string(f-g))
        
        let k = SwiftGMP.GMPDouble.mul(f, g)
        print("k (f*g): \(SwiftGMP.GMPDouble.string(k)) " + SwiftGMP.GMPDouble.string(f*g))
        
        let l = SwiftGMP.GMPDouble.div(f, g)
        print("l (f/g): \(SwiftGMP.GMPDouble.string(l)) " + SwiftGMP.GMPDouble.string(f/g))
        
        let m = SwiftGMP.GMPDouble.floor(f)
        print("m (floor(f)): \(SwiftGMP.GMPDouble.string(m))")
        XCTAssert(SwiftGMP.GMPDouble.floor(f) == SwiftGMP.GMPDouble(10), "floor of f is 10")
        
        let n = SwiftGMP.GMPDouble.ceil(f)
        print("n (ceil(f)): \(SwiftGMP.GMPDouble.string(n))")
        XCTAssert(SwiftGMP.GMPDouble.ceil(f) == SwiftGMP.GMPDouble(11), "ceil of f is 11")
    }
    
//    func testInt() {
//        let b = IntBig("246375425603637729")//.newIntBig(58)
//        let c = IntBig(58)
//        print("b: \(SwiftGMP.string(b))")
//        
//        XCTAssert(SwiftGMP.cmp(b,c) != 0, "compare error")
//        
//        print("Bytes: \(SwiftGMP.bytes(b))")
//        
//        var d = SwiftGMP.mul(b, c)
//        print("mul: \(SwiftGMP.string(d))")
//        
//        d = SwiftGMP.add(b, c)
//        print("add: \(SwiftGMP.string(d))")
//        var e = IntBig(69)
//        e = IntBig(42)
//        print("e = \(SwiftGMP.string(e))")
//        let n = SwiftGMP.getInt64(e)
//        print("n = \(n!)")
//        XCTAssert(n == 42, "Pass")
//        
//    }
    
    func testIntegers() {
        let divResult = "5866081561991374"
        let b = GMPInteger("246375425603637729")
        let c = GMPInteger(42)
        var result = GMPInteger.div(b, c)
        XCTAssert(result.description == divResult)
        print("division result: \(result.description)")
        result = b / c
        XCTAssert(result.description == divResult)
        print("division (operator) result: \(result.description)")

    }
    
    func testAll() {
        // This is an example of a functional test case.
        testIntegers()
        
        testDouble()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
