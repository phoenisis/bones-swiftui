//
//  Spacing+Shape.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

/// Extends `RoundedRectangle` to allow initialization with `BonesRadius`.
public extension RoundedRectangle {
  /// Initializes an `RoundedRectangle` with a corner radius based on the `BonesRadius` value.
  ///
  /// This allows for easy integration of a consistent design system's corner radii throughout the app.
  ///
  /// - Parameters:
  ///   - bonesRadius: The corner radius value as `BonesRadius`.
  ///   - style: The corner style as `RoundedCornerStyle`. Defaults to `.continuous`.
  @inlinable nonisolated init(bonesRadius: BonesRadius, style: RoundedCornerStyle = .continuous) {
    switch bonesRadius {
      case let .bones(radius):
        self.init(cornerRadius: radius.rawValue, style: style)
    }
  }
}

/// Extends `UnevenRoundedRectangle` for more customized corner radii configurations.
public extension UnevenRoundedRectangle {
  /// Initializes an `UnevenRoundedRectangle` with distinct corner radii for each corner.
  ///
  /// This initializer allows for the specification of different corner radii, providing
  /// flexibility for custom shapes and adhering to the design system's standards.
  ///
  /// - Parameters:
  ///   - topLeadingRadius: The top leading corner radius as `CGFloat.BonesRadius`.
  ///   - bottomLeadingRadius: The bottom leading corner radius as `CGFloat.BonesRadius`.
  ///   - bottomTrailingRadius: The bottom trailing corner radius as `CGFloat.BonesRadius`.
  ///   - topTrailingRadius: The top trailing corner radius as `CGFloat.BonesRadius`.
  ///   - style: The corner style as `RoundedCornerStyle`. Defaults to `.continuous`.
  @inlinable init(
    topLeadingRadius: CGFloat.BonesRadius = .none,
    bottomLeadingRadius: CGFloat.BonesRadius = .none,
    bottomTrailingRadius: CGFloat.BonesRadius = .none,
    topTrailingRadius: CGFloat.BonesRadius = .none,
    style: RoundedCornerStyle = .continuous
  ) {
    self.init(
      topLeadingRadius: topLeadingRadius.rawValue,
      bottomLeadingRadius: bottomLeadingRadius.rawValue,
      bottomTrailingRadius: bottomTrailingRadius.rawValue,
      topTrailingRadius: topTrailingRadius.rawValue,
      style: style
    )
  }
}

