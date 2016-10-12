# Briggs
*A reimagination of UITraitCollection*

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Briggs.svg)](https://cocoapods.org/?q=name%3Abriggs)
[![Carthage Compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/Briggs.svg)](http://cocoadocs.org/docsets/Briggs)
[![Docs](https://img.shields.io/cocoapods/metrics/doc-percent/Briggs.svg)](http://cocoadocs.org/docsets/Briggs)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/auswahlaxiom/Briggs/blob/master/LICENSE)

As seen on POSSIBLE Mobile Insights!

- [How UITraitCollection Changed Everything](https://possiblemobile.com/2016/07/adaptive-interfaces-uitraitcollection/)
- [Reimagining UITraitCollection with Briggs](https://possiblemobile.com/2016/08/reimagining-uitraitcollection-with-briggs/)
- [iOS Frameworks Part 2: Build & Ship](https://possiblemobile.com/2016/08/ios-frameworks-part-2-build-and-ship)

What if setting arbitrary constraints, views, and behaviors for specific trait collections was as easy as:
```swift
let exclusiveButton = UIButton(type: .System)
let traits: [AdaptiveAttribute] = [
    Idiom.Phone,
    Scale.TwoX,
    ForceTouch.Available,
    SizeClass.VerticalRegular,
    SizeClass.HorizontalCompact,
]

addViewFor(traits, view: exclusiveButton, to: view, withConstraints: [
    exclusiveButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
    exclusiveButton.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor),
])
```

## Abstract

*UITraitEnvironment is just too cool to be limited to views and view controllers!*

Briggs seeks to provide a crucial missing component in Apple’s API: `UITraitEnvironment.addChildTraitEnvironment:`, and adds a healthy dose of sugar to `UITraitCollection`.

### Components

- `AdaptiveElement`: The child—receives trait collection information
- `AdaptiveInterface`: The parent—provides trait collection information
- `AdaptiveAttribute`: The trait—describes trait collection information

### Containers

- `AdaptiveBehavior`: Associates a behavior and counter-behavior with a set of traits

    > Behavior is executed if incoming traits match, else counter-behavior is executed.

- `AdaptiveConstraintContainer`: Associates a set of constraints with a set of traits

    > Constraints are activated if incoming traits match, else they are deactivated.

- `AdaptiveViewContainer`: Associates a view with a set of traits

    > View is added to hierarchy if traits match, else view is removed.

## Requirements

- iOS 9.0+
- Xcode 7.3+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Briggs into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Briggs', '~> 2.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Briggs into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "auswahlaxiom/Briggs" ~> 2.0.0
```

Run `carthage update` to build the framework and drag the built `Briggs.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Briggs into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command if your project is not initialized as a git repository:

```bash
$ git init
```

- Add Briggs as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/auswahlaxiom/Briggs.git
```

- Open the new `Briggs` folder, and drag the `Briggs.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `Briggs.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `Briggs.xcodeproj` folders. It does not matter which one you select the framework from.
- Select `Briggs.framework` and click `Add`.

    > The `Briggs.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

- Add `import Briggs` a source file and get coding!

## Usage

For an in-depth dive into Briggs, please visit [Reimagining UITraitCollection with Briggs](https://possiblemobile.com/2016/08/reimagining-uitraitcollection-with-briggs/).

## Credits

Briggs was created by [Ada Turner](https://www.linkedin.com/in/ada-turner-4a663848), an iOS developer at [POSSIBLE Mobile](https://possiblemobile.com/author/ada-turner/).

## License

Briggs is released under the MIT license. See LICENSE for details.
