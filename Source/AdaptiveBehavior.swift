//
//  AdaptiveBehavior.swift
//  BriggsDemo
//

import UIKit

/**
 A container that relates a `behavior` and `counterBehavior` to a `UITraitCollection`.

 When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, `behavior` will be executed, else, `counterBehavior` will be executed if it exists.
 */
public struct AdaptiveBehavior: AdaptiveElement {

    /// A `Behavior` is a closure that takes nothing and returns nothing
    public typealias Behavior = () -> Void

    /// `UITraitCollection` associated with `behavior`.
    public let traitCollection: UITraitCollection
    /// `Behavior` executed in `updateForTraitCollection` if `incomingTraitCollection` contains `traitCollection`
    public let behavior: Behavior
    /// Optional `Behavior` executed in `updateForTraitCollection` if `incomingTraitCollection` does *not* contain `traitCollection`
    public let counterBehavior: Behavior?

    /**
     Update the `AdaptiveBehavior` with a new `UITraitCollection` which executes one of its behaviors.

     When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, `behavior` will be executed, else, `counterBehavior` will be executed.

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
