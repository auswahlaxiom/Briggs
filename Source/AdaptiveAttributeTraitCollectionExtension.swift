//
//  AdaptiveAttributeTraitCollectionExtension.swift
//  Briggs
//
//  Copyright (c) 2017 Ada Turner (https://github.com/auswahlaxiom)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions://  
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.//  
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

/**
 This extension provides a mapping between `AdaptiveAttribute` and `UITraitCollection`.
 */
public extension UITraitCollection {

    /**
     Create a `UITraitCollection` from one or more `AdaptiveAttribute`s.

     - parameter attributes: Array of `AdaptiveAttribute` from which a new `UITraitCollection` will be created
     - returns: A new `UITraitCollection` containing the traits of each `AdaptiveAttribute`
     */
    public static func create(with attributes: [AdaptiveAttribute]) -> UITraitCollection {
        let traitCollections = attributes.map { $0.generateTraitCollection() }
        return self.init(traitsFrom: traitCollections)
    }

    /**
     Check if the `UITraitCollection` contains an `AdaptiveAttribute`.

     - parameter attribute: The `AdaptiveAttribute` we want to find in the `UITraitCollection`
     - returns: Returns `true` if the `UITraitCollection` contains the `AdaptiveAttribute`, else, `false`
     */
    public func contains(_ attribute: AdaptiveAttribute) -> Bool {
        return containsTraits(in: attribute.generateTraitCollection())
    }

    /**
     Array of `AdaptiveAttribute`s that describe the `self`
     */
    public var adaptiveAttributes: [AdaptiveAttribute] {
        var attributes: [AdaptiveAttribute] = []

        switch userInterfaceIdiom {
        case .pad: attributes.append(Idiom.pad)
        case .phone: attributes.append(Idiom.phone)
        case .tv: attributes.append(Idiom.tv)
        case .carPlay: attributes.append(Idiom.carPlay)
        case .unspecified: break
        }

        switch displayScale {
        case 1.0: attributes.append(Scale.oneX)
        case 2.0: attributes.append(Scale.twoX)
        case 3.0: attributes.append(Scale.threeX)
        case 4.0: attributes.append(Scale.fourX)
        default: break
        }

        switch horizontalSizeClass {
        case .compact: attributes.append(SizeClass.horizontalCompact)
        case .regular: attributes.append(SizeClass.horizontalRegular)
        case .unspecified: break
        }

        switch verticalSizeClass {
        case .compact: attributes.append(SizeClass.verticalCompact)
        case .regular: attributes.append(SizeClass.verticalRegular)
        case .unspecified: break
        }

        switch forceTouchCapability {
        case .available: attributes.append(ForceTouch.available)
        case .unavailable: attributes.append(ForceTouch.unavailable)
        case .unknown: break
        }

        switch layoutDirection {
        case .leftToRight: attributes.append(LayoutDirection.leftToRight)
        case .rightToLeft: attributes.append(LayoutDirection.rightToLeft)
        case .unspecified: break
        }

        switch preferredContentSizeCategory {
        case .extraSmall: attributes.append(SizeCategory.extraSmall)
        case .small: attributes.append(SizeCategory.small)
        case .medium: attributes.append(SizeCategory.medium)
        case .large: attributes.append(SizeCategory.large)
        case .extraLarge: attributes.append(SizeCategory.extraLarge)
        case .extraExtraLarge: attributes.append(SizeCategory.extraExtraLarge)
        case .extraExtraExtraLarge: attributes.append(SizeCategory.extraExtraExtraLarge)
        case .accessibilityMedium: attributes.append(SizeCategory.accessibilityMedium)
        case .accessibilityLarge: attributes.append(SizeCategory.accessibilityLarge)
        case .accessibilityExtraLarge: attributes.append(SizeCategory.accessibilityExtraLarge)
        case .accessibilityExtraExtraLarge: attributes.append(SizeCategory.accessibilityExtraExtraLarge)
        case .accessibilityExtraExtraExtraLarge: attributes.append(SizeCategory.accessibilityExtraExtraExtraLarge)
        default: break
        }

        switch displayGamut {
        case .SRGB: attributes.append(DisplayGamut.SRGB)
        case .P3: attributes.append(DisplayGamut.P3)
        case .unspecified: break
        }
        
        return attributes
    }
}
