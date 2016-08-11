//
//  SizeClass.swift
//  BriggsDemo
//

import UIKit

/**
 `AdaptiveAttribute` correlating to `UITraitCollection.init(horizontalSizeClass: UIUserInterfaceSizeClass)` and `UITraitCollection.init(verticalSizeClass: UIUserInterfaceSizeClass)`
 */
public enum SizeClass: AdaptiveAttribute {

    /// Corelates to `UITraitCollection(horizontalSizeClass: .Compact)`
    case HorizontalCompact
    /// Corelates to `UITraitCollection(horizontalSizeClass: .Regular)`
    case HorizontalRegular
    /// Corelates to `UITraitCollection(verticalSizeClass: .Compact)`
    case VerticalCompact
    /// Corelates to `UITraitCollection(verticalSizeClass: .Regular)`
    case VerticalRegular

    /**
     Creates `UITraitCollection` with correlating `UIUserInterfaceSizeClass`

     - returns: New `UITraitCollection` with correlating `horizontalSizeClass` or `verticalSizeClass`
     */
    public func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .HorizontalCompact: return UITraitCollection(horizontalSizeClass: .Compact)
        case .HorizontalRegular: return UITraitCollection(horizontalSizeClass: .Regular)
        case .VerticalCompact: return UITraitCollection(verticalSizeClass: .Compact)
        case .VerticalRegular: return UITraitCollection(verticalSizeClass: .Regular)
        }
    }
}
