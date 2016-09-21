CHCubicBezier
=====================================
![](https://travis-ci.org/CapsLock-Studio/CHCubicBezier.svg?branch=master) ![swift-version](https://img.shields.io/badge/Swfit-3.0-orange.svg) ![platforms](https://img.shields.io/badge/platform-iOS%20%7C%20OSX%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg) ![pod](https://img.shields.io/badge/pod-2.0.0-blue.svg)[![SPM ready](https://img.shields.io/badge/SPM-ready-orange.svg)](https://www.swift.org)

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
let cubicBezier = CubicBezier(easing: CubicBezier.Easing.ease)
```
| enum                         | rawValue               |
|------------------------------|------------------------|
| CubicBezier.Easing.ease      | (0.25, 0.1, 0.25, 0.1) |
| CubicBezier.Easing.easeIn    | (0.42, 0.0, 1.0, 1.0)  |
| CubicBezier.Easing.easeOut   | (0.0, 0.0, 0.58, 1.0)  |
| CubicBezier.Easing.easeInOut | (0.42, 0.0, 0.58, 1.0) |
| CubicBezier.Easing.linear    | (0, 0, 1, 1)           |
You can also get current control points from `CubicBezier` instance or `CubicBezier.easing`.
```swift
CubicBezier.Easing.ease.toControlPoints() // (0.25, 0.1, 0.25, 0.1)

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

⚠️ Add follwing lines to your Podfile for Xcode 8.0 and Swift 3.0 ⚠️
```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
    end
  end
end
```

##### Via from [Swift Package Manager](https://github.com/apple/swift-package-manager)
```swift
import PackageDescription

let package = Package(
    name: "MyProject",
    dependencies: [
        .Package(url: "https://github.com/CapsLock-Studio/CHCubicBezier", majorVersion: 0)
    ]
)
```


## Migrate to Objective-C project
Accorading [Apple's document](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/Migration.html), you need to `Update import statements in your Objective-C code (to #import "ProductModuleName-Swift.h")`.
```objective-c
#import "CHCubicBezier-Swift.h"
// or
@import "CHCubicBezier.h"
```

All done! Start to use CHCubicBezier!

## License
Copyright (c) [Calvin Huang](https://github.com/Calvin-Huang). This software is licensed under the [MIT License](https://github.com/Calvin-Huang/CHRealHideUIView/blob/master/LICENSE).