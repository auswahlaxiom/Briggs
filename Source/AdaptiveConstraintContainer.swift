//
//  AdaptiveConstraintContainer.swift
//  BriggsDemo
//

import UIKit

/**
 A container to house a collection of constraints.

 When updating for an incoming UITraitCollection, if it matches `self.traitCollection`, the `constraints` will be activated, else deactivated.
 */
public struct AdaptiveConstraintContainer: AdaptiveElement {

    public let traitCollection: UITraitCollection
    public let constraints: [NSLayoutConstraint]

    public func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            NSLayoutConstraint.activateConstraints(constraints)
        } else {
            NSLayoutConstraint.deactivateConstraints(constraints)
        }
    }
}
