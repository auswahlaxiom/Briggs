//
//  Scale.swift
//  BriggsDemo
//

import UIKit

/**
 `AdaptiveAttribute` correlating to `UITraitCollection.init(displayScale scale: CGFloat)`
 */
public enum Scale: AdaptiveAttribute {

    /// Corelates to `UITraitCollection(displayScale: 1.0)`
    case OneX
    /// Corelates to `UITraitCollection(displayScale: 2.0)`
    case TwoX
    /// Corelates to `UITraitCollection(displayScale: 3.0)`
    case ThreeX
    /// Corelates to `UITraitCollection(displayScale: 4.0)`
    case FourX

    /**
     Creates `UITraitCollection` with correlating `CGFloat` scale

     - returns: New `UITraitCollection` with correlating `displayScale`
     */
    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .OneX: return UITraitCollection(displayScale: 1.0)
        case .TwoX: return UITraitCollection(displayScale: 2.0)
        case .ThreeX: return UITraitCollection(displayScale: 3.0)
        case .FourX: return UITraitCollection(displayScale: 4.0)
        }
    }
}
