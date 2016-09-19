CHCubicBezier
=====================================
![](https://travis-ci.org/CapsLock-Studio/CHCubicBezier.svg?branch=master) ![swift-version](https://img.shields.io/badge/Swfit-2.x-orange.svg) ![platforms](https://img.shields.io/badge/platform-iOS%20%7C%20OSX%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg) ![pod](https://img.shields.io/badge/pod-1.0.3-blue.svg)

## About
CubicBezier provides cubic-bezier easing like CSS transition-timing-function `cubic-bezier` acts. Translated from npm-module [bezier-easing](https://github.com/gre/bezier-easing) and implementation based on this [article](http://greweb.me/2012/02/bezier-curve-based-easing-functions-from-concept-to-implementation/).

## Usage
```swift
let cubicBezier = CubicBezier(mX1: 0, mY1: 0, mX2: 1, mY2: 0.5)
cubicBezier.easing(0.0)  // 0
cubicBezier.easing(0.5)  // 0.3125
cubicBezier.easing(1.0)  // 1
```
or
```swift
let cubicBezier = CubicBezier(controlPoints: (0.25, 0.1, 0.25, 0.1))
```
or
```swift
let cubicBezier = CubicBezier(easing: CubicBezier.Easing.Ease)
```
| enum                         | rawValue               |
|------------------------------|------------------------|
| CubicBezier.Easing.Ease      | (0.25, 0.1, 0.25, 0.1) |
| CubicBezier.Easing.EaseIn    | (0.42, 0.0, 1.0, 1.0)  |
| CubicBezier.Easing.EaseOut   | (0.0, 0.0, 0.58, 1.0)  |
| CubicBezier.Easing.EaseInOut | (0.42, 0.0, 0.58, 1.0) |
| CubicBezier.Easing.Linear    | (0, 0, 1, 1)           |
You can also get current control points from `CubicBezier` instance or `CubicBezier.Easing`.
```swift
CubicBezier.Easing.Ease.toControlPoints() // (0.25, 0.1, 0.25, 0.1)

let cubicBezier = CubicBezier(controlPoints: (0.25, 0.1, 0.25, 0.1))
cubicBezier.controlPoints // // (0.25, 0.1, 0.25, 0.1)
```

## Why CubicBezier instead of CoreAnimation
**CAMediaTimingFunction** doesn't provide any ways to calculate value at time(t).

Here is the problem what CubicBezier wants to solve, calculating B(t) value for building customized animation.

## Advanced Example
```swift
let cubicBezier = CubicBezier(mX1: 0, mY1: 0, mX2: 1, mY2: 0.5)
let duraing: Int = 3  // Seconds
var countingNumber: Int = 0
for time in duraing {
    countingNumber = countingNumber + cubicBezier(time / duraing)
    print("Count: \(countingNumber), At time: \(time)")
}
```

## Install
##### Via from [CocoaPods](https://github.com/CocoaPods/CocoaPods).
Add `pod 'CHCubicBezier'` to your Podfile and run `pod install`
```ruby
platform :ios, '8.0'

target 'MyApp' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'CHCubicBezier'

  target 'MyAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MyAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end
end

```

## Migrate to Objective-C project
Accorading ![Apple's document](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/Migration.html), you need to `Update import statements in your Objective-C code (to #import "ProductModuleName-Swift.h")`.
```objective-c
#import "CHCubicBezier-Swift.h"
// or
@import "CHCubicBezier.h"
```

All done! Start to use CHCubicBezier!

## License
Copyright (c) [Calvin Huang](https://github.com/Calvin-Huang). This software is licensed under the [MIT License](https://github.com/Calvin-Huang/CHRealHideUIView/blob/master/LICENSE).