//
//  AdaptiveBehavior.swift
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
 A container that relates a `behavior` and `counterBehavior` to a `UITraitCollection`.

 When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, `behavior` will be executed, else, `counterBehavior` will be executed if it exists.
 */
public struct AdaptiveBehavior: AdaptiveElement {

    /// A `Behavior` is a closure that takes nothing and returns nothing
    public typealias Behavior = () -> Void

    /// `UITraitCollection` associated with `behavior`.
    public let traitCollection: UITraitCollection
    /// `Behavior` executed in `update(for incomingTraitCollection:)` if `incomingTraitCollection` contains `traitCollection`
    public let behavior: Behavior
    /// Optional `Behavior` executed in `update(for incomingTraitCollection:)` if `incomingTraitCollection` does *not* contain `traitCollection`
    public let counterBehavior: Behavior?

    /**
     Update the `AdaptiveBehavior` with a new `UITraitCollection` which executes one of its behaviors.

     When updating for an incoming `UITraitCollection`, if it contains `self.traitCollection`, `behavior` will be executed, else, `counterBehavior` will be executed.

     - parameter incomingTraitCollection: The `UITraitCollection` which determines if we execute `behavior` or `counterBehavior`.
     */
    public func update(for incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraits(in: traitCollection) {
            behavior()
        } else {
            counterBehavior?()
        }
    }
}
