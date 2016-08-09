//
//  AdaptiveViewContainer.swift
//  BriggsDemo
//

import UIKit

/**
 A container to house an parent and a child UIView.

 When updating for an incoming UITraitCollection, if it matches `self.traitCollection`, the `parent` will add the `child` as a subview if it is not already added, else it will remove the `child` from its `parent`.
 */
public struct AdaptiveViewContainer: AdaptiveElement {

    public unowned let parent: UIView
    public let child: UIView
    public let traitCollection: UITraitCollection

    public func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            if child.superview != parent {
                parent.addSubview(child)
            }
        } else {
            child.removeFromSuperview()
        }
    }
}
