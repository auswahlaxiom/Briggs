//
//  AdaptiveViewContainer.swift
//  BriggsDemo
//

import UIKit

/**
 A container to house an parent and a child UIView.

 When updating for an incoming UITraitCollection, if it matches `self.traitCollection`, the `parent` will add the `child` as a subview if it is not already added, else it will remove the `child` from its `parent`.
 */
struct AdaptiveViewContainer: AdaptiveElement {

    unowned let parent: UIView
    let child: UIView
    let traitCollection: UITraitCollection

    func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            if child.superview != parent {
                parent.addSubview(child)
            }
        } else {
            child.removeFromSuperview()
        }
    }
}
