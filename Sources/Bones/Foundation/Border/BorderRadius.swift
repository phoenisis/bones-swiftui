//
//  BorderRadius.swift
//
//
//  Created by Quentin PIDOUX on 12/03/2024.
//

import Foundation

/// A dictionary to define custom radius values for different spacing categories.
///
/// This variable can be used to assign specific radius values to the predefined
/// `CGFloat.BonesSpacing` categories. It allows for a flexible definition of radius
/// sizes across an application, supporting a consistent design system.
public var bonesRadius: [CGFloat.BonesSpacing: CGFloat] = [:]

/// An enumeration representing different radius sizes.
///
/// This enum provides a standardized way to define and use radius sizes within the
/// application. It leverages the `CGFloat.BonesRadius` type to specify the radius,
/// ensuring that the values are consistent with the defined design system.
public enum BonesRadius {
  case bones(CGFloat.BonesRadius)
}

extension CGFloat {
  /// An enumeration of predefined radius sizes.
  ///
  /// This enum defines a set of standard radius sizes (none, small, medium, large)
  /// that can be used throughout the application to ensure consistency in UI elements'
  /// corner radii. Each case is associated with a specific `CGFloat` value that
  /// represents its size.
  ///
  /// - `none`: A radius of 0, representing no curvature.
  /// - `small`: A small radius size. Defaults to 4 if not defined in `bonesSpacings`.
  /// - `medium`: A medium radius size. Defaults to 8 if not defined in `bonesSpacings`.
  /// - `large`: A large radius size. Defaults to 16 if not defined in `bonesSpacings`.
  ///
  /// The actual values for `small`, `medium`, and `large` can be customized by assigning
  /// different values to the corresponding cases in `bonesSpacings`.
  public enum BonesRadius: CGFloat, CaseIterable, Identifiable {
    case none
    case small
    case medium
    case large

    /// The raw value of the radius size.
    ///
    /// This computed property returns the actual `CGFloat` value for the radius size,
    /// looking up the value in `bonesSpacings` dictionary if available, and providing
    /// default values for each size category if not explicitly defined.
    public var rawValue: CGFloat {
      switch self {
        case .none: return bonesSpacings[.none] ?? 0
        case .small:  return bonesSpacings[.small] ?? 4
        case .medium: return bonesSpacings[.medium] ?? 8
        case .large: return bonesSpacings[.large] ?? 16
      }
    }

    /// An identifier for each radius size.
    ///
    /// This computed property provides a unique string identifier for each radius size,
    /// facilitating the use of these sizes in contexts where unique identification is
    /// necessary, such as in some UI frameworks or design systems.
    public var id: String {
      switch self {
        case .none: return "none"
        case .small:  return "small"
        case .medium: return "medium"
        case .large: return "large"
      }
    }
  }
}
