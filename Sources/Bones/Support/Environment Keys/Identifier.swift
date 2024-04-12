//
//  Identifier.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

/// A custom environment key for storing a view's identifier.
struct IdentifierKey: EnvironmentKey {
  static let defaultValue: AnyHashable? = nil
}

/// Extends `EnvironmentValues` to include a custom identifier for views.
public extension EnvironmentValues {

  /// An identifier stored in a view’s environment.
  var identifier: AnyHashable? {
    get { self[IdentifierKey.self] }
    set { self[IdentifierKey.self] = newValue }
  }
}

/// Extends `View` to allow setting a unique identifier.
public extension View {

  /// Assigns a unique identifier to the view.
  ///
  /// This method extends a view with the ability to set and retrieve a custom identifier
  /// from its environment, providing a way to uniquely identify views beyond SwiftUI's `id` modifier.
  ///
  /// - Parameter id: The identifier to assign to the view.
  /// - Returns: A view modified with a unique identifier.
  func identifier(_ id: some Hashable) -> some View {
    self
      .environment(\.identifier, id)
      .id(id)
      .anchorPreference(key: IDPreferenceKey.self, value: .bounds) { bounds in
        [IDPreference(id: id, bounds: bounds)]
      }
  }
}

/// A preference key for storing a collection of `IDPreference`.
public struct IDPreferenceKey: PreferenceKey {
  public typealias Value = [IDPreference]

  public static var defaultValue: Value = []

  public static func reduce(value: inout Value, nextValue: () -> Value) {
    value.append(contentsOf: nextValue())
  }
}

/// Represents a preference value that includes an identifier and anchor bounds.
public struct IDPreference: Equatable {
  let id: AnyHashable
  let bounds: Anchor<CGRect>

  /// Provides a way to compare `IDPreference` values, taking into account the identifier and bounds.
  public static func == (lhs: IDPreference, rhs: IDPreference) -> Bool {
    lhs.id == rhs.id && lhs.bounds == rhs.bounds
  }
}
