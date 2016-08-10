//
//  Idiom.swift
//  BriggsDemo
//

import UIKit

/**
 `AdaptiveAttribute` correlating to `UITraitCollection.init(userInterfaceIdiom idiom: UIUserInterfaceIdiom)`
 */
public enum Idiom: AdaptiveAttribute {

    case Phone
    case Pad
    case TV
    case CarPlay

    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .Phone: return UITraitCollection(userInterfaceIdiom: .Phone)
        case .Pad: return UITraitCollection(userInterfaceIdiom: .Pad)
        case .TV: return UITraitCollection(userInterfaceIdiom: .TV)
        case .CarPlay: return UITraitCollection(userInterfaceIdiom: .CarPlay)
        }
    }
}
