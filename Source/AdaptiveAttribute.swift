//
//  AdaptiveAttribute.swift
//  BriggsDemo
//

import UIKit

/**
 An `AdaptiveAttribute` represents a trait in a `UITraitCollection`.
 */
public protocol AdaptiveAttribute {

    /**
     Creates a `UITraitCollection` corresponding to the trait `self` represents
     */
    func generateTraitCollection() -> UITraitCollection
}
