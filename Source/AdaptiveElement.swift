//
//  AdaptiveElement.swift
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
 An `AdaptiveElement` tracks its own `UITraitCollection` and can react to external `UITraitCollection`s.

 `AdaptiveElement` represents the receiving child in an inheritence hierarchy of parent-child relationships passing trait  information.
 */
public protocol AdaptiveElement {

    /**
     Internal `UITraitCollection`
     */
    var traitCollection: UITraitCollection { get }

    /**
     Implement to react to external `UITraitCollections`. A reaction could be:

     - To update `self.traitCollection` to match the outside environment
     - To compare `self.traitCollection` against `incomingTraitCollection` to enact some behavior
     - To simply perform some action using `incomingTraitCollection`

     - parameter incomingTraitCollection: An external `UITraitCollection`.
     */
    func update(for incomingTraitCollection: UITraitCollection)
}
