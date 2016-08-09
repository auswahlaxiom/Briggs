//
//  Scale.swift
//  BriggsDemo
//

import UIKit

/**
 AdaptiveAttribute correlating to `UITraitCollection.init(displayScale scale: CGFloat)`
 */
public enum Scale: AdaptiveAttribute {

    case OneX
    case TwoX
    case ThreeX
    case FourX

    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .OneX: return UITraitCollection(displayScale: 1.0)
        case .TwoX: return UITraitCollection(displayScale: 2.0)
        case .ThreeX: return UITraitCollection(displayScale: 3.0)
        case .FourX: return UITraitCollection(displayScale: 4.0)
        }
    }
}
