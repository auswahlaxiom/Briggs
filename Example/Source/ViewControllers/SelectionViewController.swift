//
//  SelectionViewController.swift
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
 A view controller to select either a Native-implemented demo or a Briggs-implemented demo.
 */
class SelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Types

    enum Option {

        case TakeOne
        case TakeTwo

        var title: String {
            let title: String

            switch self {
            case .TakeOne:
                title = "Native API"
            case .TakeTwo:
                title = "Briggs API"
            }

            return title
        }

        func createViewController() -> UIViewController {
            let viewController: UIViewController

            switch self {
            case .TakeOne:
                viewController = NativeViewController()
            case .TakeTwo:
                viewController = BriggsViewController()
            }

            return viewController
        }
    }

    // MARK: - Static

    struct K {

        static let reuseIdentifier = "SelectionReuseIdentifier"
    }

    // MARK: - UIViewController

    override func loadView() {
        view = UIView()
        setupViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Briggs Demo"
    }

    // MARK: - SelectionViewController

    let selections: [Option] = [.TakeOne, .TakeTwo]

    // MARK: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = selections.count
        return count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(K.reuseIdentifier, forIndexPath: indexPath)
        let selection = selections[indexPath.row]
        cell.textLabel?.text = selection.title

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selection = selections[indexPath.row]
        let viewController = selection.createViewController()
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    // MARK: - Interface

    private var tableView: UITableView!

    private func setupViews() {
        view.backgroundColor = UIColor.whiteColor()

        tableView = UITableView(frame: CGRect.zero, style: .Plain)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: K.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

        tableView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor).active = true
        tableView.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
        view.trailingAnchor.constraintEqualToAnchor(tableView.trailingAnchor).active = true
        view.bottomAnchor.constraintEqualToAnchor(tableView.bottomAnchor).active = true
    }
}
