CHCubicBezier
=====================================
![](https://travis-ci.org/CapsLock-Studio/CHCubicBezier.svg?branch=master) ![swift-version](https://img.shields.io/badge/Swfit-2.2-orange.svg) ![platforms](https://img.shields.io/badge/platform-iOS%20%7C%20OSX%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg) ![pod](https://img.shields.io/badge/pod-1.0.0-blue.svg)

About
=====================================
CubicBezier provides cubic-bezier easing like CSS transition-timing-function `cubic-bezier` acts. Translated from npm-module ![bezier-easing](https://github.com/gre/bezier-easing) and implementation based on this ![article](http://greweb.me/2012/02/bezier-curve-based-easing-functions-from-concept-to-implementation/).

Usage
=====================================
```swift
let cubicBezier = CubicBezier(mX1: 0, mY1: 0, mX2: 1, mY2: 0.5)
cubicBezier.easing(0.0)  // 0
cubicBezier.easing(0.5)  // 0.3125
cubicBezier.easing(1.0)  // 1
```

Why CubicBezier instead of CoreAnimation
=====================================
There are some CoreAnimation APIs provide for Bezier timing function, see ![CAMediaTimingFunction - getControlPointAtIndex](https://developer.apple.com/reference/quartzcore/camediatimingfunction/1522057-getcontrolpointatindex?language=objc).

However, the old APIs need to interact with C pointers. Of course, I'm not that familar to interact with C pointer, even though ![Apple's document here](https://developer.apple.com/swift/blog/?id=6) also said `Swift works hard to make interaction with C pointers convenient, because of their pervasiveness within Cocoa, while providing some level of safety`. And most important, the document is really unreadable. 

Here is the problem what CubicBezier wants to solve, calculating B(t) value for building customized animation.

Advanced Example
=====================================
```swift
let cubicBezier = CubicBezier(mX1: 0, mY1: 0, mX2: 1, mY2: 0.5)
let duraing: Int = 3  // Seconds
var countingNumber: Int = 0
for time in duraing {
    countingNumber = countingNumber + cubicBezier(time / duraing)
    print("Count: \(countingNumber), At time: \(time)")
}
```