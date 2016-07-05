//
//  CHCubicBezierTests.swift
//  CHCubicBezierTests
//
//  Created by Calvin on 6/23/16.
//  Copyright © 2016 CapsLock. All rights reserved.
//

import XCTest
@testable import CHCubicBezier

class CHCubicBezierTests: XCTestCase {
    func testCubicBezier() {
        let cubicBezier = CubicBezier(mX1: 0, mY1: 0, mX2: 1, mY2: 0.5)
        XCTAssertEqual(cubicBezier.easing(0.0), 0.0)
        XCTAssertEqual(cubicBezier.easing(0.5), 0.3125, "Value: \(cubicBezier.easing(0.5)) should equals to 0.3125")
        XCTAssertEqual(cubicBezier.easing(1.0), 1.0)
    }
    
    func testCubicBezierEasingEase() {
        let cubicBezierEasingEase = CubicBezier(easing: CubicBezier.Easing.Ease)
        XCTAssertEqual(cubicBezierEasingEase.easing(0.0), 0.0)
        XCTAssertEqual(cubicBezierEasingEase.easing(0.5), 0.40542312526365115)
        XCTAssertEqual(cubicBezierEasingEase.easing(0.6), 0.52220528235001173)
        XCTAssertEqual(cubicBezierEasingEase.easing(0.7), 0.640774293957621)
        XCTAssertEqual(cubicBezierEasingEase.easing(1.0), 1.0)
    }
    
    func testCubicBezierEasingEaseIn() {
        let cubicBezierEasingEaseIn = CubicBezier(easing: CubicBezier.Easing.EaseIn)
        XCTAssertEqual(cubicBezierEasingEaseIn.easing(0.0), 0.0)
        XCTAssertEqual(cubicBezierEasingEaseIn.easing(0.5), 0.3153567342653617)
        XCTAssertEqual(cubicBezierEasingEaseIn.easing(0.6), 0.42911907698767621)
        XCTAssertEqual(cubicBezierEasingEaseIn.easing(0.7), 0.554811856916553)
        XCTAssertEqual(cubicBezierEasingEaseIn.easing(1.0), 1.0)
    }
    
    func testCubicBezierEasingEaseOut() {
        let cubicBezierEasingEaseOut = CubicBezier(easing: CubicBezier.Easing.EaseOut)
        XCTAssertEqual(cubicBezierEasingEaseOut.easing(0.0), 0.0)
        XCTAssertEqual(cubicBezierEasingEaseOut.easing(0.5), 0.68464326573463841)
        XCTAssertEqual(cubicBezierEasingEaseOut.easing(0.6), 0.78513906125636046)
        XCTAssertEqual(cubicBezierEasingEaseOut.easing(0.7), 0.870423239254529)
        XCTAssertEqual(cubicBezierEasingEaseOut.easing(1.0), 1.0)
    }
    
    func testCubicBezierEasingEaseInOut() {
        let cubicBezierEasingEaseInOut = CubicBezier(easing: CubicBezier.Easing.EaseInOut)
        XCTAssertEqual(cubicBezierEasingEaseInOut.easing(0.0), 0.0)
        XCTAssertEqual(cubicBezierEasingEaseInOut.easing(0.5), 0.5)
        XCTAssertEqual(cubicBezierEasingEaseInOut.easing(0.6), 0.668116153265794)
        XCTAssertEqual(cubicBezierEasingEaseInOut.easing(0.7), 0.81260430454206756)
        XCTAssertEqual(cubicBezierEasingEaseInOut.easing(1.0), 1.0)
    }
    
    func testCubicBezierEasingEaseLinear() {
        let cubicBezierEasingLinear = CubicBezier(easing: CubicBezier.Easing.Linear)
        XCTAssertEqual(cubicBezierEasingLinear.easing(0.0), 0.0)
        XCTAssertEqual(cubicBezierEasingLinear.easing(0.5), 0.5)
        XCTAssertEqual(cubicBezierEasingLinear.easing(1.0), 1.0)
    }
}
