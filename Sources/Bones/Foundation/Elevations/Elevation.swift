//
//  Elevation.swift
//
//
//  Created by Quentin PIDOUX on 26/09/2023.
//

import SwiftUI

/// Represents a style of shadow that can be applied to views.
public enum BonesShadowStyle {
  case bones(ShadowStyle.BonesShadowToken)
}

public extension ShadowStyle {
  /// Defines tokens for different shadow styles within the design system.
  enum BonesShadowToken: Int, CaseIterable, Identifiable {
    case none
    case reallyClose
    case close
    case medium
    case far

    public var id: String {
      switch self {
        case .none: return "none"
        case .reallyClose: return "reallyClose"
        case .close: return "close"
        case .medium: return "medium"
        case .far: return "far"
      }
    }
  }

  /// Provides a convenient way to access predefined shadow styles.
  struct bones {
    /// Returns a drop shadow style based on a `BonesShadowToken`.
    public static func drop(_ style: BonesShadowToken) -> ShadowStyle {
      switch style {
        case .none:
          return ShadowStyle.drop(color: .clear, radius: 0)
        case .reallyClose:
          return ShadowStyle.drop(color: .bones.black.opacity(0.15), radius: 2, x: 0, y: 2)
        case .close:
          return ShadowStyle.drop(color: .bones.black.opacity(0.15), radius: 4, x: 0, y: 4)
        case .medium:
          return ShadowStyle.drop(color: .bones.black.opacity(0.15), radius: 8, x: 0, y: 8)
        case .far:
          return ShadowStyle.drop(color: .bones.black.opacity(0.25), radius: 16, x: 0, y: 8)
      }
    }

    /// Returns an inner shadow style based on a `BonesShadowToken`.
    public static func inner(_ style: BonesShadowToken) -> ShadowStyle {
      switch style {
        case .none:
          return ShadowStyle.inner(color: .clear, radius: 0)
        case .reallyClose:
          return ShadowStyle.inner(color: .bones.black.opacity(0.15), radius: 2, x: 0, y: 2)
        case .close:
          return ShadowStyle.inner(color: .bones.black.opacity(0.15), radius: 4, x: 0, y: 4)
        case .medium:
          return ShadowStyle.inner(color: .bones.black.opacity(0.15), radius: 8, x: 0, y: 8)
        case .far:
          return ShadowStyle.inner(color: .bones.black.opacity(0.25), radius: 16, x: 0, y: 8)
      }
    }
  }
}

/// Extends `View` to include a method for applying shadows with `BonesShadowStyle`.
public extension View {
  /// Applies a shadow to the view based on a specified `BonesShadowStyle`.
  ///
  /// - Parameters:
  ///   - color: The color of the shadow. Defaults to black with opacity suited to the shadow intensity.
  ///   - radius: The `BonesShadowStyle` indicating the shadow token to use.
  /// - Returns: A view with the specified shadow applied.
  func shadow(
    color: Color = Color.bones.black,
    radius: BonesShadowStyle = .bones(.close)
  ) -> some View {
    switch radius {
      case let .bones(token):
        switch token {
          case .none:
            return self.shadow(color: .clear, radius: 0, x: 0, y: 0)
          case .reallyClose:
            return self.shadow(color: color.opacity(0.15), radius: 2, x: 0, y: 2)
          case .close:
            return self.shadow(color: color.opacity(0.15), radius: 4, x: 0, y: 4)
          case .medium:
            return self.shadow(color: color.opacity(0.15), radius: 8, x: 0, y: 8)
          case .far:
            return self.shadow(color: color.opacity(0.25), radius: 16, x: 0, y: 8)
        }
    }
  }
}
