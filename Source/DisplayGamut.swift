//
//  DisplayGamut.swift
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
 `AdaptiveAttribute` correlating to `init(displayGamut: UIDisplayGamut)`
 */
public enum DisplayGamut: AdaptiveAttribute {

    /// Corelates to `UITraitCollection(displayGamut: .SRGB)`
    case SRGB
    /// Corelates to `UITraitCollection(displayGamut: .P3)`
    case P3

    /**
     Creates `UITraitCollection` with correlating `UIUserInterfaceDisplayGamut`

     - returns: New `UITraitCollection` with correlating `displayGamut`
     */
    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .SRGB: return UITraitCollection(displayGamut: .SRGB)
        case .P3: return UITraitCollection(displayGamut: .P3)
        }
    }
}
