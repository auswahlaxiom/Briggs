//
//  AdaptiveBehavior.swift
//  BriggsDemo
//

import UIKit

/**
 A container that relates a `behavior` and `counterBehavior` to a `UITraitCollection`.

 When updating for an incoming `UITraitCollection`, if it matches `self.traitCollection`, `behavior` will be executed, else, `counterBehavior` will be executed if it exists.
 */
public struct AdaptiveBehavior: AdaptiveElement {

    public typealias Behavior = () -> Void

    public let traitCollection: UITraitCollection
    public let behavior: Behavior
    public let counterBehavior: Behavior?

    /**
     Update the `AdaptiveBehavior` with a new `UITraitCollection` which executes one of its behaviors.

     When updating for an incoming `UITraitCollection`, if it matches `self.traitCollection`, `behavior` will be executed, else, `counterBehavior` will be executed.

     - parameter incomingTraitCollection: The `UITraitCollection` which determines if we execute `behavior` or `counterBehavior`.
     */
    public func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            behavior()
        } else {
            counterBehavior?()
        }
    }
}
