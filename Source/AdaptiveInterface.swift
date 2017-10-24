//
//  AdaptiveInterface.swift
//  Briggs
//
//  Copyright (c) 2017 Ada Turner (https://github.com/auswahlaxiom)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions://  
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.//  
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

/**
 An `AdaptiveInterface` contains a collection of `AdaptiveElement`s and forwards `update(for incomingTraitCollection:)` to each of them.

 `AdaptiveInterface` represents the supplying parent in an inheritence hierarchy of parent-child relationships passing trait  information.

 Recommended override for `UITraitEnvironment`s:
 ```
 override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
     super.traitCollectionDidChange(previousTraitCollection)
     update(for: traitCollection)
 }
 ```

 Extension methods provide conveniences for adding `Behavior`s, `NSLayoutConstraint`s, and `UIView`s with associated `UITraitCollection`s. These are stored in `AdaptiveElement`-conforming containers which append to `self.adaptiveElements`.

 `AdaptiveInterface` is a class-only protocol to allow for mutating extension methods.
 */
public protocol AdaptiveInterface: class, AdaptiveElement {

    /**
     `adaptiveElements` represent `self`'s children. Each element will be forwarded calls to `update(for incomingTraitCollection:)` that `self` recieves.
     */
    var adaptiveElements: [AdaptiveElement] { get set }
}

/**
 The default implementation of `update(for incomingTraitCollection:)` forwards `update(for incomingTraitCollection:)` to each item in `self.adaptiveElements`.
 */
public extension AdaptiveInterface {

    /**
     Default `AdaptiveInterface` implementation forwards `update(for incomingTraitCollection:)` to each of `self`'s children.

     - note: Child adaptive elements whose `traitCollection` is *not* contained by `incomingTraitCollection` are updated first to avoid conflicting behaviors being active at the same time.
     */
    public func update(for incomingTraitCollection: UITraitCollection) {
        adaptiveElements.filter { incomingTraitCollection.containsTraits(in: $0.traitCollection) == false }.forEach { $0.update(for: incomingTraitCollection) }
        adaptiveElements.filter { incomingTraitCollection.containsTraits(in: $0.traitCollection) == true }.forEach { $0.update(for: incomingTraitCollection) }
    }
}

/**
 Convenience methods for adding `AdaptiveBehavior`s, `AdaptiveConstraintContainer`s, and `AdaptiveViewContainer`s.

 Each has a raw form, which takes a `UITraitCollection`, and two wrappers which take one or more `AdaptiveAttribute`s.
 */
public extension AdaptiveInterface {

    // MARK: - Convenience Methods

    // MARK: Add Behavior

    /**
     Add a `Behavior` and counter-`Behavior` for a `UITraitCollection`

     Convenience for creating an `AdaptiveBehavior` and adding it to `self.adaptiveElements`

     - parameter traitCollection: `UITraitCollection` for which `behavior` will be executed
     - parameter behavior: `Behavior` to be executed if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     - parameter counterBehavior: Optional `Behavior` (defaults to `nil`) to be executed if `incomingTraitCollection` does not contain `traitCollection` when `update(for incomingTraitCollection:)` is called
     */
    public func addBehavior(for traitCollection: UITraitCollection, behavior: @escaping AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let adaptiveBehavior = AdaptiveBehavior(traitCollection: traitCollection, behavior: behavior, counterBehavior: counterBehavior)

        adaptiveElements.append(adaptiveBehavior)
    }

    /**
     Add a `Behavior` and counter-`Behavior` for a set of `AdaptiveAttribute`s

     Convenience for creating an `AdaptiveBehavior` and adding it to `self.adaptiveElements`

     - parameter attributes: Array of `AdaptiveAttribute`s used to create a `UITraitCollection` for which `behavior` will be executed
     - parameter behavior: `Behavior` to be executed if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     - parameter counterBehavior: Optional `Behavior` (defaults to `nil`) to be executed if `incomingTraitCollection` does not contain `traitCollection` when `update(for incomingTraitCollection:)` is called
     */
    public func addBehavior(for attributes: [AdaptiveAttribute], behavior: @escaping AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addBehavior(for: traitCollection, behavior: behavior, counterBehavior: counterBehavior)
    }

    /**
     Add a `Behavior` and counter-`Behavior` for a single `AdaptiveAttribute`

     Convenience for creating an `AdaptiveBehavior` and adding it to `self.adaptiveElements`

     - parameter attribute: Single `AdaptiveAttribute` used to create a `UITraitCollection` for which `behavior` will be executed
     - parameter behavior: `Behavior` to be executed if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     - parameter counterBehavior: Optional `Behavior` (defaults to `nil`) to be executed if `incomingTraitCollection` does not contain `traitCollection` when `update(for incomingTraitCollection:)` is called
     */
    public func addBehavior(for attribute: AdaptiveAttribute, behavior: @escaping AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addBehavior(for: traitCollection, behavior: behavior, counterBehavior: counterBehavior)
    }

    // MARK: Add NSLayoutConstraints

    /**
     Add an array of `NSLayoutConstraint`s for a `UITraitCollection`

     Convenience for creating an `AdaptiveConstraintContainer` and adding it to `self.adaptiveElements`

     - parameter traitCollection: `UITraitCollection` for which `constraints` will be activated
     - parameter constraints: Array of `NSLayoutConstraint`s to be activated if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     */
    public func addConstraints(for traitCollection: UITraitCollection, constraints: [NSLayoutConstraint]) {
        let container = AdaptiveConstraintContainer(traitCollection: traitCollection, constraints: constraints)

        adaptiveElements.append(container)
    }

    /**
     Add an array of `NSLayoutConstraint`s for a set of `AdaptiveAttribute`s

     Convenience for creating an `AdaptiveConstraintContainer` and adding it to `self.adaptiveElements`

     - parameter attributes: Array of `AdaptiveAttribute`s used to create a `UITraitCollection` for which `constraints` will be activated
     - parameter constraints: Variadic array of `NSLayoutConstraint`s to be activated if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     */
    public func addConstraints(for attributes: [AdaptiveAttribute], constraints: NSLayoutConstraint...) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addConstraints(for: traitCollection, constraints: constraints)
    }

    /**
     Add an array of `NSLayoutConstraint`s for a single `AdaptiveAttribute`

     Convenience for creating an `AdaptiveConstraintContainer` and adding it to `self.adaptiveElements`

     - parameter attribute: Single `AdaptiveAttribute` used to create a `UITraitCollection` for which `constraints` will be activated
     - parameter constraints: Variadic array of `NSLayoutConstraint`s to be activated if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     */
    public func addConstraints(for attribute: AdaptiveAttribute, constraints: NSLayoutConstraint...) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addConstraints(for: traitCollection, constraints: constraints)
    }

    // MARK: Add UIViews

    /**
     Add a `UIView` and associated array of `NSLayoutConstraint`s for a `UITraitCollection`

     Convenience for creating an `AdaptiveViewContainer` and optional `AdaptiveConstraintContainer` and adding them to `self.adaptiveElements`

     - parameter traitCollection: `UITraitCollection` for which `view` will be added to `parent` and `constraints` will be activated
     - parameter view: `UIView` to be added to `parent` if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     - parameter parent: `UIView` to which `view` will be added
     - parameter constraints: Optional array of `NSLayoutConstraint`s (defaults to `[]`) used to create an `AdaptiveViewContainer` which will be added alongside the `AdaptiveViewContainer`. Use to specify constraints relating to `view` that will be activated under the same conditions that `view` is added to `parent`.
     */
    public func addView(for traitCollection: UITraitCollection, view: UIView, parent: UIView, constraints: @autoclosure () -> [NSLayoutConstraint] = []) {
        // Add view to parent, so constraints can be created if they are supplied. Will be removed in updateForTraitCollection if necessary.
        parent.addSubview(view)

        let viewContainer = AdaptiveViewContainer(traitCollection: traitCollection, parent: parent, child: view)
        adaptiveElements.append(viewContainer)

        // `constraints` is an autoclosure because constraints relating `view` to `parent` or its superviews cannot be instantiated until `view` is in `parent`'s heirarchy
        let constructedConstraints = constraints()

        if constructedConstraints.isEmpty == false {
            let constraintContainer = AdaptiveConstraintContainer(traitCollection: traitCollection, constraints: constructedConstraints)
            adaptiveElements.append(constraintContainer)
        }
    }

    /**
     Add a `UIView` and associated array of `NSLayoutConstraint`s for a set of `AdaptiveAttribute`s

     Convenience for creating an `AdaptiveViewContainer` and optional `AdaptiveConstraintContainer` and adding them to `self.adaptiveElements`

     - parameter attributes: Array of `AdaptiveAttribute`s used to create a `UITraitCollection` for which `view` will be added to `parent` and `constraints` will be activated
     - parameter view: `UIView` to be added to `parent` if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     - parameter parent: `UIView` to which `view` will be added
     - parameter constraints: Optional array of `NSLayoutConstraint`s (defaults to `[]`) used to create an `AdaptiveViewContainer` which will be added alongside the `AdaptiveViewContainer`. Use to specify constraints relating to `view` that will be activated under the same conditions that `view` is added to `parent`.
     */
    public func addView(for attributes: [AdaptiveAttribute], view: UIView, parent: UIView, constraints: @autoclosure () -> [NSLayoutConstraint] = []) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addView(for: traitCollection, view: view, parent: parent, constraints: constraints)
    }

    /**
     Add a `UIView` and associated array of `NSLayoutConstraint`s for a single `AdaptiveAttribute`

     Convenience for creating an `AdaptiveViewContainer` and optional `AdaptiveConstraintContainer` and adding them to `self.adaptiveElements`

     - parameter attribute: Single `AdaptiveAttribute` used to create a `UITraitCollection` for which `view` will be added to `parent` and `constraints` will be activated
     - parameter view: `UIView` to be added to `parent` if `incomingTraitCollection` contains `traitCollection` when `update(for incomingTraitCollection:)` is called
     - parameter parent: `UIView` to which `view` will be added
     - parameter constraints: Optional array of `NSLayoutConstraint`s (defaults to `[]`) used to create an `AdaptiveViewContainer` which will be added alongside the `AdaptiveViewContainer`. Use to specify constraints relating to `view` that will be activated under the same conditions that `view` is added to `parent`.
     */
    public func addView(for attribute: AdaptiveAttribute, view: UIView, parent: UIView, constraints: @autoclosure () -> [NSLayoutConstraint] = []) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addView(for: traitCollection, view: view, parent: parent, constraints: constraints)
    }
}
