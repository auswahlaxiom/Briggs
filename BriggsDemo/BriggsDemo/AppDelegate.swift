//
//  AppDelegate.swift
//  BriggsDemo
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - UIApplicationDelegate

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupRootViewController()

        return true
    }

    // MARK: - Internal

    var rootViewController: UINavigationController?

    // MARK: - Private

    private func setupRootViewController() {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let selectionViewController = SelectionViewController()
        let selectionNavigationController = UINavigationController(rootViewController: selectionViewController)

        window.rootViewController = selectionNavigationController
        window.makeKeyAndVisible()

        self.rootViewController = selectionNavigationController
        self.window = window
    }
}
