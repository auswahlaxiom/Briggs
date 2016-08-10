//
//  AdaptiveAttributeTraitCollectionExtension.swift
//  BriggsDemo
//

import UIKit

/**
 This extension provides a mapping between AdaptiveAttribute and UITraitCollection.
 */
public extension UITraitCollection {

    static func create(with attributes: [AdaptiveAttribute]) -> UITraitCollection {
        let traitCollections = attributes.map { $0.generateTraitCollection() }
        return self.init(traitsFromCollections: traitCollections)
    }

    func contains(attribute attribute: AdaptiveAttribute) -> Bool {
        return containsTraitsInCollection(attribute.generateTraitCollection())
    }

    var adaptiveAttributes: [AdaptiveAttribute] {
        var attributes: [AdaptiveAttribute] = []

        switch userInterfaceIdiom {
        case .Pad: attributes.append(Idiom.Pad)
        case .Phone: attributes.append(Idiom.Phone)
        case .TV: attributes.append(Idiom.TV)
        case .CarPlay: attributes.append(Idiom.CarPlay)
        case .Unspecified: break
        }

        switch displayScale {
        case 1.0: attributes.append(Scale.OneX)
        case 2.0: attributes.append(Scale.TwoX)
        case 3.0: attributes.append(Scale.ThreeX)
        case 4.0: attributes.append(Scale.FourX)
        default: break
        }

        switch horizontalSizeClass {
        case .Compact: attributes.append(SizeClass.HorizontalCompact)
        case .Regular: attributes.append(SizeClass.HorizontalRegular)
        case .Unspecified: break
        }

        switch verticalSizeClass {
        case .Compact: attributes.append(SizeClass.VerticalCompact)
        case .Regular: attributes.append(SizeClass.VerticalRegular)
        case .Unspecified: break
        }

        switch forceTouchCapability {
        case .Available: attributes.append(ForceTouch.Available)
        case .Unavailable: attributes.append(ForceTouch.Unavailable)
        case .Unknown: break
        }
        
        return attributes
    }
}