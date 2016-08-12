//
//  NativeViewController.swift
//  BriggsDemo
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
 A view controller that uses native API to achieve the following adaptive behaviors:
    1. A label that is red when displayed on @2x scale devices with Force Touch capability, and blue for all other devices
    2. A continue button stretches edge-to-edge in horizontal-compact, and has a fixed width in horizontal-regular
    3. An iPad-exclusive button that is centered at the top of the screen
 */
class NativeViewController: UIViewController {

    // MARK: - Static

    struct K {

        static let margin: CGFloat = 12.0
    }

    // MARK: - UIViewController

    override func loadView() {
        view = UIView()
        setupViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Native API"
    }

    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Requirement 1: red text for @2x with force touch, otherwise blue text
        let twoX = UITraitCollection(displayScale: 2.0)
        let forceTouchAvailable = UITraitCollection(forceTouchCapability: .Available)
        let forceTouchAvailableAndTwoX = UITraitCollection(traitsFromCollections: [twoX, forceTouchAvailable])

        if traitCollection.containsTraitsInCollection(forceTouchAvailableAndTwoX) {
            welcomeLabel.textColor = UIColor.redColor()
        } else {
            welcomeLabel.textColor = UIColor.blueColor()
        }

        // Requirement 2: full width in horizontal compact, fixed width in horizontal regular
        let horizontalCompact = UITraitCollection(horizontalSizeClass: .Compact)

        if traitCollection.containsTraitsInCollection(horizontalCompact) {
            continueButtonFixedWidthConstraint.active = false
            continueButtonFullWidthConstraint.active = true
        }

        let horizontalRegular = UITraitCollection(horizontalSizeClass: .Regular)

        if traitCollection.containsTraitsInCollection(horizontalRegular) {
            continueButtonFullWidthConstraint.active = false
            continueButtonFixedWidthConstraint.active = true
        }

        // Requirement 3: iPad exclusive button
        let idiomPad = UITraitCollection(userInterfaceIdiom: .Pad)

        if traitCollection.containsTraitsInCollection(idiomPad) {
            if iPadExclusiveButton.superview == nil {
                view.addSubview(iPadExclusiveButton)
            }

            iPadExclusiveButtonConstraints.forEach { $0.active = true }
        } else {
            iPadExclusiveButtonConstraints.forEach { $0.active = false }
            iPadExclusiveButton.removeFromSuperview()
        }
    }

    // MARK: - Interface

    private var welcomeLabel: UILabel!
    private var continueButton: UIButton!
    private var iPadExclusiveButton: UIButton!

    private var continueButtonFullWidthConstraint: NSLayoutConstraint!
    private var continueButtonFixedWidthConstraint: NSLayoutConstraint!

    private var iPadExclusiveButtonConstraints: [NSLayoutConstraint]!

    private func setupViews() {
        view.backgroundColor = UIColor.whiteColor()

        welcomeLabel = createWelcomeLabel()
        view.addSubview(welcomeLabel)

        welcomeLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        welcomeLabel.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true

        continueButton = createContinueButton()
        view.addSubview(continueButton)

        bottomLayoutGuide.topAnchor.constraintEqualToAnchor(continueButton.bottomAnchor, constant: K.margin).active = true
        view.trailingAnchor.constraintEqualToAnchor(continueButton.trailingAnchor, constant: K.margin).active = true
        continueButton.heightAnchor.constraintEqualToConstant(45.0).active = true

        continueButtonFullWidthConstraint = continueButton.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: K.margin)
        continueButtonFixedWidthConstraint = continueButton.widthAnchor.constraintEqualToConstant(180.0)

        iPadExclusiveButton = createiPadExclusiveButton()
        view.addSubview(iPadExclusiveButton)

        iPadExclusiveButtonConstraints = [
            iPadExclusiveButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
            iPadExclusiveButton.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: K.margin)
        ]
    }

    private func createWelcomeLabel() -> UILabel {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Hello World"
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false

        return welcomeLabel
    }

    private func createContinueButton() -> UIButton {
        let continueButton = UIButton(type: .System)
        continueButton.setTitle("Continue", forState: .Normal)
        continueButton.addTarget(self, action: #selector(continueAction), forControlEvents: .TouchUpInside)
        continueButton.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 1.0, alpha: 1.0)
        continueButton.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 1.0, alpha: 1.0).CGColor
        continueButton.layer.borderWidth = 2.0
        continueButton.layer.cornerRadius = 4.0
        continueButton.translatesAutoresizingMaskIntoConstraints = false

        return continueButton
    }

    private func createiPadExclusiveButton() -> UIButton {
        let iPadExclusiveButton = UIButton(type: .System)
        iPadExclusiveButton.setTitle("iPad Only!", forState: .Normal)
        iPadExclusiveButton.addTarget(self, action: #selector(iPadExclusiveAction), forControlEvents: .TouchUpInside)
        iPadExclusiveButton.translatesAutoresizingMaskIntoConstraints = false

        return iPadExclusiveButton
    }

    // MARK: - Actions

    func continueAction(sender: UIButton) {
        let alert = UIAlertController(title: "Great Success!", message: "You may continue.", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Cool", style: .Default, handler: nil)
        alert.addAction(ok)
        presentViewController(alert, animated: true, completion: nil)
    }

    func iPadExclusiveAction(sender: UIButton) {
        let alert = UIAlertController(title: "iPad Achieved!", message: "You are holding an iPad.", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "Nice", style: .Default, handler: nil)
        alert.addAction(ok)
        presentViewController(alert, animated: true, completion: nil)
    }
}
