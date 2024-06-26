//
//  Spacing.swift
//
//
//  Created by Quentin PIDOUX on 12/03/2024.
//

import Foundation

extension BonesConfig {
  /// A dictionary to define custom spacing values for different spacing categories.
  ///
  /// This variable allows for the assignment of specific spacing values to the predefined
  /// `CGFloat.BonesSpacing` categories, facilitating a consistent spacing system across
  /// an application.
  public static var spacings: [CGFloat.BonesSpacing: CGFloat] = [:]
}

/// An enumeration representing different spacing sizes.
///
/// This enum provides a standardized way to define and use spacing sizes within the
/// application, leveraging the `CGFloat.BonesSpacing` type for specifying the spacing,
/// ensuring consistency with the defined design system.
public enum BonesSpacing: Sendable { case bones(CGFloat.BonesSpacing) }

extension CGFloat {
  /// An enumeration of predefined spacing sizes.
  ///
  /// Defines a set of standard spacing sizes (none, small, medium, xMedium, large, xLarge)
  /// to be used throughout the application. This ensures consistency in spacing between UI
  /// elements. Each case is associated with a `CGFloat` value representing its size.
  ///
  /// - `none`: A spacing of 0, indicating no spacing.
  /// - `small`: A small spacing size. Defaults to 4 if not defined in `bonesSpacings`.
  /// - `medium`: A medium spacing size. Defaults to 16 if not defined in `bonesSpacings`.
  /// - `xMedium`: An extra medium spacing size. Defaults to 24 if not defined in `bonesSpacings`.
  /// - `large`: A large spacing size. Defaults to 32 if not defined in `bonesSpacings`.
  /// - `xLarge`: An extra large spacing size. Defaults to 64 if not defined in `bonesSpacings`.
  ///
  /// The actual values for these spacing sizes can be customized by assigning different
  /// values to the corresponding cases in `bonesSpacings`.
  public enum BonesSpacing: CaseIterable, Identifiable, Sendable {
    case none
    case small
    case medium
    case xMedium
    case large
    case xLarge

    /// The  value of the spacing size.
    ///
    /// Returns the actual `CGFloat` value for the spacing size, looking up the value
    /// in `bonesSpacings` dictionary if available, and providing default values for
    /// each size category if not explicitly defined.
    public var value: CGFloat {
      switch self {
        case .none: return BonesConfig.spacings[.none] ?? 0
        case .small:  return BonesConfig.spacings[.small] ?? 4
        case .medium: return BonesConfig.spacings[.medium] ?? 16
        case .xMedium: return BonesConfig.spacings[.xMedium] ?? 24
        case .large: return BonesConfig.spacings[.large] ?? 32
        case .xLarge: return BonesConfig.spacings[.xLarge] ?? 64
      }
    }

    /// An identifier for each spacing size.
    ///
    /// Provides a unique string identifier for each spacing size, facilitating the use of
    /// these sizes in contexts where unique identification is necessary, such as in some
    /// UI frameworks or design systems.
    public var id: String {
      switch self {
        case .none: return "none"
        case .small:  return "small"
        case .medium: return "medium"
        case .xMedium: return "xMedium"
        case .large: return "large"
        case .xLarge: return "xLarge"
      }
    }
  }
}
