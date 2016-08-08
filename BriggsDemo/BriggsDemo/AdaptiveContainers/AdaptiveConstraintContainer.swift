//
//  AdaptiveConstraintContainer.swift
//  BriggsDemo
//

import UIKit

/**
 A container to house a collection of constraints.

 When updating for an incoming UITraitCollection, if it matches `self.traitCollection`, the `constraints` will be activated, else deactivated.
 */
struct AdaptiveConstraintContainer: AdaptiveElement {

    let traitCollection: UITraitCollection
    let constraints: [NSLayoutConstraint]

    func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            NSLayoutConstraint.activateConstraints(constraints)
        } else {
            NSLayoutConstraint.deactivateConstraints(constraints)
        }
    }
}
