//
//  AdaptiveAttributeTraitCollectionExtension.swift
//  Briggs
//
//  Copyright (c) 2016 Ada Turner (https://github.com/auswahlaxiom)
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
        return self.init(traitsFromCollections: traitCollections)
    }

    /**
     Check if the `UITraitCollection` contains an `AdaptiveAttribute`.

     - parameter attribute: The `AdaptiveAttribute` we want to find in the `UITraitCollection`
     - returns: Returns `true` if the `UITraitCollection` contains the `AdaptiveAttribute`, else, `false`
     */
    public func contains(attribute attribute: AdaptiveAttribute) -> Bool {
        return containsTraitsInCollection(attribute.generateTraitCollection())
    }

    /**
     Array of `AdaptiveAttribute`s that describe the `self`
     */
    public var adaptiveAttributes: [AdaptiveAttribute] {
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
