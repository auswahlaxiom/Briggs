//
//  Idiom.swift
//  BriggsDemo
//

import UIKit

/**
 `AdaptiveAttribute` correlating to `UITraitCollection.init(userInterfaceIdiom idiom: UIUserInterfaceIdiom)`
 */
public enum Idiom: AdaptiveAttribute {

    /// Corelates to `UITraitCollection(userInterfaceIdiom: .Phone)`
    case Phone
    /// Corelates to `UITraitCollection(userInterfaceIdiom: .Pad)`
    case Pad
    /// Corelates to `UITraitCollection(userInterfaceIdiom: .TV)`
    case TV
    /// Corelates to `UITraitCollection(userInterfaceIdiom: .CarPlay)`
    case CarPlay

    /**
     Creates `UITraitCollection` with correlating `UIUserInterfaceIdiom`

     - returns: New `UITraitCollection` with correlating `userInterfaceIdiom`
     */
    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .Phone: return UITraitCollection(userInterfaceIdiom: .Phone)
        case .Pad: return UITraitCollection(userInterfaceIdiom: .Pad)
        case .TV: return UITraitCollection(userInterfaceIdiom: .TV)
        case .CarPlay: return UITraitCollection(userInterfaceIdiom: .CarPlay)
        }
    }
}
