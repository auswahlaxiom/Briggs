//
//  ForceTouch.swift
//  BriggsDemo
//

import UIKit

/**
 `AdaptiveAttribute` correlating to `UITraitCollection.init(forceTouchCapability capability: UIForceTouchCapability)`
 */
public enum ForceTouch: AdaptiveAttribute {

    /// Correlates to `UITraitCollection(forceTouchCapability: .Unavailable)
    case Unavailable
    /// Corelates to `UITraitCollection(forceTouchCapability: .Available)
    case Available

    /**
     Creates `UITraitCollection` with correlating `UIForceTouchCapability`

     - returns: New `UITraitCollection` with correlating `forceTouchCapability`
     */
    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .Unavailable: return UITraitCollection(forceTouchCapability: .Unavailable)
        case .Available: return UITraitCollection(forceTouchCapability: .Available)
        }
    }
}
