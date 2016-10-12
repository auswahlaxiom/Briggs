//
//  BriggsViewController.swift
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

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        update(for: traitCollection)
    }

    // MARK: - AdaptiveInterface

    var adaptiveElements: [AdaptiveElement] = []

    // MARK: - Interface

    private func setupViews() {
        view.backgroundColor = UIColor.white

        let welcomeLabel = createWelcomeLabel()
        view.addSubview(welcomeLabel)

        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        // Requirement 1: red text for @2x with force touch, otherwise blue text
        addBehavior(for: [Scale.twoX, ForceTouch.available], behavior: {
            welcomeLabel.textColor = UIColor.red
        }, counterBehavior: {
            welcomeLabel.textColor = UIColor.blue
        })

        let continueButton = createContinueButton()
        view.addSubview(continueButton)

        bottomLayoutGuide.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: K.margin).isActive = true
        view.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor, constant: K.margin).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 45.0).isActive = true

        // Requirement 2: full width in horizontal compact, fixed width in horizontal regular
        addConstraints(for: SizeClass.horizontalCompact, constraints:
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: K.margin)
        )

        addConstraints(for: SizeClass.horizontalRegular, constraints:
            continueButton.widthAnchor.constraint(equalToConstant: 180.0)
        )

        let iPadExclusiveButton = createiPadExclusiveButton()

        // Requirement 3: iPad exclusive button
        addView(for: Idiom.pad, view: iPadExclusiveButton, parent: view, constraints: [
            iPadExclusiveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPadExclusiveButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: K.margin)
        ])
    }

    private func createWelcomeLabel() -> UILabel {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Hello World"
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false

        return welcomeLabel
    }

    private func createContinueButton() -> UIButton {
        let continueButton = UIButton(type: .system)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        continueButton.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 1.0, alpha: 1.0)
        continueButton.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 1.0, alpha: 1.0).cgColor
        continueButton.layer.borderWidth = 2.0
        continueButton.layer.cornerRadius = 4.0
        continueButton.translatesAutoresizingMaskIntoConstraints = false

        return continueButton
    }

    private func createiPadExclusiveButton() -> UIButton {
        let iPadExclusiveButton = UIButton(type: .system)
        iPadExclusiveButton.setTitle("iPad Only!", for: .normal)
        iPadExclusiveButton.addTarget(self, action: #selector(iPadExclusiveAction), for: .touchUpInside)
        iPadExclusiveButton.translatesAutoresizingMaskIntoConstraints = false

        return iPadExclusiveButton
    }

    // MARK: - Actions

    func continueAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Great Success!", message: "You may continue.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Cool", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

    func iPadExclusiveAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "iPad Achieved!", message: "You are holding an iPad.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Nice", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
