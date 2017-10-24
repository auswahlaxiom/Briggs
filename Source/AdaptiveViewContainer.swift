//
//  AdaptiveViewContainer.swift
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
 A container that relates a `parent` and `child` `UIView` to a `UITraitCollection`.

 When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, the `parent` will add the `child` as a subview if it is not already added, else, it will remove the `child` from its `parent`.
 */
public struct AdaptiveViewContainer: AdaptiveElement {

    /// `UITraitCollection` associated with `child`.
    public let traitCollection: UITraitCollection
    /// `UIView` that will add `child` as a subview in `update(for incomingTraitCollection:)` if `incomingTraitCollection` contains `traitCollection`
    public unowned let parent: UIView
    /// `UIView` that will be added to `parent` as a subview or removed from its `superview` in `update(for incomingTraitCollection:)` if `incomingTraitCollection` does or does not contain `traitCollection`, respectively
    public let child: UIView

    /**
     Update the `AdaptiveViewContainer` with a new `UITraitCollection` which adds or removes `child` from `parent`.

     When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, the `parent` will add the `child` as a subview if it is not already added, else, it will remove the `child` from its `superview`.

     - parameter incomingTraitCollection: The `UITraitCollection` which determines if we add or remove `child`.
     */
    public func update(for incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraits(in: traitCollection) {
            if child.superview != parent {
                parent.addSubview(child)
            }
        } else {
            if child.superview != nil {
                child.removeFromSuperview()
            }
        }
    }
}
