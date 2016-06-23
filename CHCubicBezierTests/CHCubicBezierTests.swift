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
        XCTAssert(cubicBezier.easing(0.0) == 0.0)
        XCTAssert(cubicBezier.easing(0.5) == 0.3125, "Value: \(cubicBezier.easing(0.5)) should equals to 0.3125")
        XCTAssert(cubicBezier.easing(1.0) == 1.0)
    }
}
