//
//  AdaptiveConstraintContainer.swift
//  BriggsDemo
//

import UIKit

/**
 A container that relates a collection of `NSLayoutConstraint`s to a `UITraitCollection`.

 When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, the `constraints` will be activated, else, deactivated.
 */
public struct AdaptiveConstraintContainer: AdaptiveElement {

    /// `UITraitCollection` associated with `constraints`.
    public let traitCollection: UITraitCollection
    /// Array of `NSLayoutConstraint` activated or deactivated in `updateForTraitCollection` if `incomingTraitCollection` does or does not contain `traitCollection`, respectively
    public let constraints: [NSLayoutConstraint]

    /**
     Update the `AdaptiveConstraintContainer` with a new `UITraitCollection` which activates or deactivates constraints.

     When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, the `constraints` will be activated, else, deactivated.

     - parameter incomingTraitCollection: The `UITraitCollection` which determines if we activate or deactivate `constraints`.
     */
    public func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            NSLayoutConstraint.activateConstraints(constraints)
        } else {
            NSLayoutConstraint.deactivateConstraints(constraints)
        }
    }
}
