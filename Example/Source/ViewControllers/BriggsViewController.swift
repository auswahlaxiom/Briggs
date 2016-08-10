//
//  BriggsViewController.swift
//  BriggsDemo
//

import UIKit
import Briggs

/**
 A view controller that uses Briggs Adaptive API to elegantly achieve the following adaptive behaviors:
    1. A label that is red when displayed on @2x scale devices with Force Touch capability, and blue for all other devices
    2. A continue button stretches edge-to-edge in horizontal-compact, and has a fixed width in horizontal-regular
    3. An iPad-exclusive button that is centered at the top of the screen
 */
class BriggsViewController: UIViewController, AdaptiveInterface {

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
        title = "Briggs API"
    }

    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateForTraitCollection(traitCollection)
    }

    // MARK: - AdaptiveInterface

    var adaptiveElements: [AdaptiveElement] = []

    // MARK: - Interface

    private func setupViews() {
        view.backgroundColor = UIColor.whiteColor()

        let welcomeLabel = createWelcomeLabel()
        view.addSubview(welcomeLabel)

        welcomeLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        welcomeLabel.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true

        // Requirement 1: red text for @2x with force touch, otherwise blue text
        addBehaviorFor([Scale.TwoX, ForceTouch.Available], behavior: {
            welcomeLabel.textColor = UIColor.redColor()
        }, counterBehavior: {
            welcomeLabel.textColor = UIColor.blueColor()
        })

        let continueButton = createContinueButton()
        view.addSubview(continueButton)

        bottomLayoutGuide.topAnchor.constraintEqualToAnchor(continueButton.bottomAnchor, constant: K.margin).active = true
        view.trailingAnchor.constraintEqualToAnchor(continueButton.trailingAnchor, constant: K.margin).active = true
        continueButton.heightAnchor.constraintEqualToConstant(45.0).active = true

        // Requirement 2: full width in horizontal compact, fixed width in horizontal regular
        addConstraintsFor(SizeClass.HorizontalCompact, constraints:
            continueButton.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: K.margin)
        )

        addConstraintsFor(SizeClass.HorizontalRegular, constraints:
            continueButton.widthAnchor.constraintEqualToConstant(180.0)
        )

        let iPadExclusiveButton = createiPadExclusiveButton()

        // Requirement 3: iPad exclusive button
        addViewFor(Idiom.Pad, view: iPadExclusiveButton, to: view, withConstraints: [
            iPadExclusiveButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
            iPadExclusiveButton.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: K.margin)
        ])
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
