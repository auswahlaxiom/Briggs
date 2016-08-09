//
//  ForceTouch.swift
//  BriggsDemo
//

import UIKit

/**
 AdaptiveAttribute correlating to `UITraitCollection.init(forceTouchCapability capability: UIForceTouchCapability)`
 */
public enum ForceTouch: AdaptiveAttribute {
    
    case Unavailable
    case Available

    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .Unavailable: return UITraitCollection(forceTouchCapability: .Unavailable)
        case .Available: return UITraitCollection(forceTouchCapability: .Available)
        }
    }
}
