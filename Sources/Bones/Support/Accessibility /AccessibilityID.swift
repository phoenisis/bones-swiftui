//
//  AccessibilityID.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

/// A structure to represent accessibility identifiers in a type-safe manner
public struct AccessibilityID: RawRepresentable, Equatable, Hashable, Sendable {
  public let rawValue: String

  /// Initializes an `AccessibilityID` with a raw string value.
  ///
  /// - Parameter rawValue: The string value to use as the accessibility identifier.
  public init(rawValue: String) {
    self.rawValue = rawValue
  }
}

/// Extends `View` to allow setting accessibility identifiers using `AccessibilityID`
public extension View {
  /// Sets the accessibility identifier of the view to a given `AccessibilityID`.
  ///
  /// This method provides a type-safe way to assign accessibility identifiers, improving
  /// code readability and maintainability.
  ///
  /// - Parameter accessibilityID: The `AccessibilityID` to set as the view's accessibility identifier.
  /// - Returns: A view with the specified accessibility identifier.
  func accessibilityIdentifier(_ accessibilityID: AccessibilityID) -> some View {
    self.accessibilityIdentifier(accessibilityID.rawValue)
  }
}
