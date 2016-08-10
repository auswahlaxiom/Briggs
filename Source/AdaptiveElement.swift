//
//  AdaptiveElement.swift
//  BriggsDemo
//

import UIKit

/**
 An `AdaptiveElement` tracks its own `UITraitCollection` and can react to external `UITraitCollection`s.

 `AdaptiveElement` represents the receiving child in an inheritence hierarchy of parent-child relationships passing trait  information.
 */
public protocol AdaptiveElement {

    /**
     Internal `UITraitCollection`
     */
    var traitCollection: UITraitCollection { get }

    /**
     Implement to react to external `UITraitCollections`. A reaction could be:

     - To update `self.traitCollection` to match the outside environment
     - To compare `self.traitCollection` against `incomingTraitCollection` to enact some behavior
     - To simply perform some action using `incomingTraitCollection`

     - parameter incomingTraitCollection: An external `UITraitCollection`.
     */
    func updateForTraitCollection(incomingTraitCollection: UITraitCollection)
}
