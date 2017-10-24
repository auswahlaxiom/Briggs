//
//  AdaptiveConstraintContainer.swift
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
 A container that relates a collection of `NSLayoutConstraint`s to a `UITraitCollection`.

 When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, the `constraints` will be activated, else, deactivated.
 */
public struct AdaptiveConstraintContainer: AdaptiveElement {

    /// `UITraitCollection` associated with `constraints`.
    public let traitCollection: UITraitCollection
    /// Array of `NSLayoutConstraint` activated or deactivated in `update(for incomingTraitCollection:)` if `incomingTraitCollection` does or does not contain `traitCollection`, respectively
    public let constraints: [NSLayoutConstraint]

    /**
     Update the `AdaptiveConstraintContainer` with a new `UITraitCollection` which activates or deactivates constraints.

     When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, the `constraints` will be activated, else, deactivated.

     - parameter incomingTraitCollection: The `UITraitCollection` which determines if we activate or deactivate `constraints`.
     */
    public func update(for incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraits(in: traitCollection) {
            NSLayoutConstraint.activate(constraints)
        } else {
            NSLayoutConstraint.deactivate(constraints)
        }
    }
}
