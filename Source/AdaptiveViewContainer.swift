//
//  AdaptiveViewContainer.swift
//  BriggsDemo
//

import UIKit

/**
 A container that relates a `parent` and `child` `UIView` to a `UITraitCollection`.

 When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, the `parent` will add the `child` as a subview if it is not already added, else, it will remove the `child` from its `parent`.
 */
public struct AdaptiveViewContainer: AdaptiveElement {

    /// `UITraitCollection` associated with `child`.
    public let traitCollection: UITraitCollection
    /// `UIView` that will add `child` as a subview in `updateForTraitCollection` if `incomingTraitCollection` contains `traitCollection`
    public unowned let parent: UIView
    /// `UIView` that will be added to `parent` as a subview or removed from its `superview` in `updateForTraitCollection` if `incomingTraitCollection` does or does not contain `traitCollection`, respectively
    public let child: UIView

    /**
     Update the `AdaptiveViewContainer` with a new `UITraitCollection` which adds or removes `child` from `parent`.

     When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, the `parent` will add the `child` as a subview if it is not already added, else, it will remove the `child` from its `superview`.

     - parameter incomingTraitCollection: The `UITraitCollection` which determines if we add or remove `child`.
     */
    public func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraitsInCollection(traitCollection) {
            if child.superview != parent {
                parent.addSubview(child)
            }
        } else {
            if child.superview != nil {
                child.removeFromSuperview()
            }
        }
    }
}
