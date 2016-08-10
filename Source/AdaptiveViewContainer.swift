//
//  AdaptiveViewContainer.swift
//  BriggsDemo
//

import UIKit

/**
 A container that relates a `parent` and `child` `UIView` to a `UITraitCollection`.

 When updating for an incoming `UITraitCollection`, if it matches `self.traitCollection`, the `parent` will add the `child` as a subview if it is not already added, else, it will remove the `child` from its `parent`.
 */
public struct AdaptiveViewContainer: AdaptiveElement {

    public unowned let parent: UIView
    public let child: UIView
    public let traitCollection: UITraitCollection

    /**
     Update the `AdaptiveViewContainer` with a new `UITraitCollection` which adds or removes `child` from `parent`.

     When updating for an incoming `UITraitCollection`, if it matches `self.traitCollection`, the `parent` will add the `child` as a subview if it is not already added, else, it will remove the `child` from its `parent`.

     - parameter incomingTraitCollection: The `UITraitCollection` which determines if we add or remove `child`.
     */
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
