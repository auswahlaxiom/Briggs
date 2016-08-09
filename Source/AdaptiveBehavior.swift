//
//  AdaptiveBehavior.swift
//  BriggsDemo
//

import UIKit

/**
 A container to house a behavior and counter behavior.

 When updating for an incoming UITraitCollection, if it matches `self.traitCollection`, `behavior` will be executed, else `counterBehavior` will be executed if it exists.
 */
public struct AdaptiveBehavior: AdaptiveElement {

    public typealias Behavior = () -> Void

    public let traitCollection: UITraitCollection
    public let behavior: Behavior
    public let counterBehavior: Behavior?

    public func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            behavior()
        } else {
            counterBehavior?()
        }
    }
}
