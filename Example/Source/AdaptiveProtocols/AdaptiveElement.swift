//
//  AdaptiveElement.swift
//  BriggsDemo
//

import UIKit

/**
 An AdaptiveElement tracks its own UITraitCollection and can react to external UITraitCollection changes.
 AdaptiveElement is similar to UITraitEnvironment, except it reacts to external changes in UITraitCollection, instead of reacting to internal changes, as does `public func traitCollectionDidChange(previousTraitCollection: UITraitCollection?)`
 */
protocol AdaptiveElement {

    var traitCollection: UITraitCollection { get }
    func updateForTraitCollection(incomingTraitCollection: UITraitCollection)
}
