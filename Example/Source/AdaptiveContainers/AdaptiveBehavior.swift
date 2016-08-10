//
//  AdaptiveBehavior.swift
//  BriggsDemo
//

import UIKit

/**
 A container to house a behavior and counter behavior.

 When updating for an incoming UITraitCollection, if it matches `self.traitCollection`, `behavior` will be executed, else `counterBehavior` will be executed if it exists.
 */
struct AdaptiveBehavior: AdaptiveElement {

    typealias Behavior = () -> Void

    let traitCollection: UITraitCollection
    let behavior: Behavior
    let counterBehavior: Behavior?

    func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            behavior()
        } else {
            counterBehavior?()
        }
    }
}
