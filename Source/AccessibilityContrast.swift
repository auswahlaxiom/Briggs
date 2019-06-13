//
//  AccessibilityContrast.swift
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
 `AdaptiveAttribute` correlating to `init(accessibilityContrast: UIAccessibilityContrast)`
 */
@available(iOS 13.0, *)
public enum AccessibilityContrast: AdaptiveAttribute {
    
    /// Corelates to `UITraitCollection(accessibilityContrast: .normal)`
    case normal
    
    /// Corelates to `UITraitCollection(accessibilityContrast: .high)`
    case high
    
    /**
     Creates `UITraitCollection` with correlating `UIAccessibilityContrast`
     
     - returns: New `UITraitCollection` with correlating `accessibilityContrast`
     */
    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .normal:
            return UITraitCollection(accessibilityContrast: .normal)
        case .high:
            return UITraitCollection(accessibilityContrast: .high)
        }
    }
}
