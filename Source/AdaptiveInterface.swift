//
//  AdaptiveInterface.swift
//  BriggsDemo
//

import UIKit

/**
 An AdaptiveInterface manages a collection of AdaptiveElements, and can add elements that are only active under certain UITraitCollection scenarios.
 Extension methods provide conveniences for adding common elements like UIViews and NSLayoutConstraints, which append to `adaptiveElements`. For this reason, AdaptiveInterface is a class-only protocol to simplify the "mutating" story.
 */
public protocol AdaptiveInterface: class, AdaptiveElement {

    var adaptiveElements: [AdaptiveElement] { get set }
}

/**
 The default implementation of `updateForTraitCollection` forwards `updateForTraitCollection` to each item in `adaptiveElements`.
 */
public extension AdaptiveInterface {

    // MARK: AdaptiveInterface

    public func updateForTraitCollection(incomingTraitCollection: UITraitCollection) {
        // Update all adaptive elements for which the trait collection does not match first to avoid conflicting behaviors being active at the same time
        adaptiveElements.filter { incomingTraitCollection.containsTraitsInCollection($0.traitCollection) == false }.forEach { $0.updateForTraitCollection(incomingTraitCollection) }
        adaptiveElements.filter { incomingTraitCollection.containsTraitsInCollection($0.traitCollection) == true }.forEach { $0.updateForTraitCollection(incomingTraitCollection) }
    }
}

/**
 Convenience methods for adding adaptive behaviors, constraints, and views. 
 Each has a raw form, which takes a UITraitCollection, and two wrappers that take one or more AdaptiveAttributes.
 */
public extension AdaptiveInterface {

    // MARK: Add Behavior

    /**
     Add a behavior for a given UITraitCollection
     */
    public func addBehaviorFor(traitCollection: UITraitCollection, behavior: AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let adaptiveBehavior = AdaptiveBehavior(traitCollection: traitCollection, behavior: behavior, counterBehavior: counterBehavior)

        adaptiveElements.append(adaptiveBehavior)
    }

    /**
     Add a behavior for a given set of AdaptiveAttributes
     */
    public func addBehaviorFor(attributes: [AdaptiveAttribute], behavior: AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addBehaviorFor(traitCollection, behavior: behavior, counterBehavior: counterBehavior)
    }

    /**
     Convenience for adding behavior for a single AdaptiveAttribute
     */
    public func addBehaviorFor(attribute: AdaptiveAttribute, behavior: AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addBehaviorFor(traitCollection, behavior: behavior, counterBehavior: counterBehavior)
    }

    // MARK: Add NSLayoutConstraints

    /**
     Add an array of constraints for a given UITraitCollection
     */
    public func addConstraintsFor(traitCollection: UITraitCollection, constraints: [NSLayoutConstraint]) {
        let container = AdaptiveConstraintContainer(traitCollection: traitCollection, constraints: constraints)

        adaptiveElements.append(container)
    }

    /**
     Add a number of constraints for a given set of AdaptiveAttributes
     */
    public func addConstraintsFor(attributes: [AdaptiveAttribute], constraints: NSLayoutConstraint...) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addConstraintsFor(traitCollection, constraints: constraints)
    }

    /**
     Convenience for adding constrants for a single AdaptiveAttribute
     */
    public func addConstraintsFor(attribute: AdaptiveAttribute, constraints: NSLayoutConstraint...) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addConstraintsFor(traitCollection, constraints: constraints)
    }

    // MARK: Add UIViews

    /**
     Add a view and constarints for a given UITraitCollection
     */
    public func addViewFor(traitCollection: UITraitCollection, view: UIView, to parent: UIView, @autoclosure withConstraints constraintBuilder: () -> [NSLayoutConstraint] = []) {
        // Temporarily add view to parent, so constraints can be created if necessary. Will be removed in updateForTraitCollection if necessary.
        parent.addSubview(view)

        let viewContainer = AdaptiveViewContainer(parent: parent, child: view, traitCollection: traitCollection)
        adaptiveElements.append(viewContainer)

        let constraints = constraintBuilder()

        if constraints.isEmpty == false {
            let constraintContainer = AdaptiveConstraintContainer(traitCollection: traitCollection, constraints: constraints)
            adaptiveElements.append(constraintContainer)
        }
    }

    /**
     Add a view and constarints for a given set of AdaptiveAttributes
     */
    public func addViewFor(attributes: [AdaptiveAttribute], view: UIView, to parent: UIView, @autoclosure withConstraints constraintBuilder: () -> [NSLayoutConstraint] = []) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addViewFor(traitCollection, view: view, to: parent, withConstraints: constraintBuilder)
    }

    /**
     Convenience for adding a view and constarints for a single AdaptiveAttribute
     */
    public func addViewFor(attribute: AdaptiveAttribute, view: UIView, to parent: UIView, @autoclosure withConstraints constraintBuilder: () -> [NSLayoutConstraint] = []) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addViewFor(traitCollection, view: view, to: parent, withConstraints: constraintBuilder)
    }
}
