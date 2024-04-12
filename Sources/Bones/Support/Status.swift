//
//  Status.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

/// Represents different status types within an application.
public enum Status: Equatable {
  case info
  case success
  case warning
  case critical
}

/// Extends `Status` to provide UI-related properties.
public extension Status {
  /// The color associated with each status.
  ///
  /// This computed property returns a `Color` that visually represents the status,
  /// facilitating a consistent visual language across the application.
  var color: Color {
    switch self {
      case .info: .bones.primary
      case .success: .bones.success
      case .warning: .orange
      case .critical: .bones.failure
    }
  }

  /// The default haptic feedback associated with each status.
  ///
  /// This computed property suggests a type of haptic feedback to accompany the status,
  /// enhancing the user experience with tactile feedback.
  var defaultHapticFeedback: HapticsProvider.HapticFeedbackType {
    switch self {
      case .info, .success: .light(0.5)
      case .warning: .notification(.warning)
      case .critical: .notification(.error)
    }
  }
}
