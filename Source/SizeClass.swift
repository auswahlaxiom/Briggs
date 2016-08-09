//
//  SizeClass.swift
//  BriggsDemo
//

import UIKit

/**
 AdaptiveAttribute correlating to `UITraitCollection.init(horizontalSizeClass: UIUserInterfaceSizeClass)` and `UITraitCollection.init(verticalSizeClass: UIUserInterfaceSizeClass)`
 */
public enum SizeClass: AdaptiveAttribute {

    case HorizontalCompact
    case HorizontalRegular
    case VerticalCompact
    case VerticalRegular

    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .HorizontalCompact: return UITraitCollection(horizontalSizeClass: .Compact)
        case .HorizontalRegular: return UITraitCollection(horizontalSizeClass: .Regular)
        case .VerticalCompact: return UITraitCollection(verticalSizeClass: .Compact)
        case .VerticalRegular: return UITraitCollection(verticalSizeClass: .Regular)
        }
    }
}
