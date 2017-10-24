//
//  SizeCategory.swift
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
 `AdaptiveAttribute` correlating to `init(preferredContentSizeCategory: UIContentSizeCategory)`
 */
public enum SizeCategory: AdaptiveAttribute {

    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .extraSmall)
    case extraSmall
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .small)
    case small
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .medium)
    case medium
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .large)
    case large
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .extraLarge)
    case extraLarge
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .extraExtraLarge)
    case extraExtraLarge
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .extraExtraExtraLarge)
    case extraExtraExtraLarge
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .accessibilityMedium)
    case accessibilityMedium
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .accessibilityLarge)
    case accessibilityLarge
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .accessibilityExtraLarge)
    case accessibilityExtraLarge
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraLarge)
    case accessibilityExtraExtraLarge
    /// Corelates to `UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)
    case accessibilityExtraExtraExtraLarge

    /**
     Creates `UITraitCollection` with correlating `UIUserInterfaceSizeCategory`

     - returns: New `UITraitCollection` with correlating `sizeCategory`
     */
    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .extraSmall: return UITraitCollection(preferredContentSizeCategory: .extraSmall)
        case .small: return UITraitCollection(preferredContentSizeCategory: .small)
        case .medium: return UITraitCollection(preferredContentSizeCategory: .medium)
        case .large: return UITraitCollection(preferredContentSizeCategory: .large)
        case .extraLarge: return UITraitCollection(preferredContentSizeCategory: .extraLarge)
        case .extraExtraLarge: return UITraitCollection(preferredContentSizeCategory: .extraExtraLarge)
        case .extraExtraExtraLarge: return UITraitCollection(preferredContentSizeCategory: .extraExtraExtraLarge)
        case .accessibilityMedium: return UITraitCollection(preferredContentSizeCategory: .accessibilityMedium)
        case .accessibilityLarge: return UITraitCollection(preferredContentSizeCategory: .accessibilityLarge)
        case .accessibilityExtraLarge: return UITraitCollection(preferredContentSizeCategory: .accessibilityExtraLarge)
        case .accessibilityExtraExtraLarge: return UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraLarge)
        case .accessibilityExtraExtraExtraLarge: return UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)
        }
    }
}
