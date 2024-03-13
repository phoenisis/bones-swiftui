//
//  Colors+PageBackground.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

/// An environment key for setting the page background color throughout the application.
public struct PageBackgroundColorKey: EnvironmentKey {
  /// The default value of the page background color, using the `bones.background` color.
  public static let defaultValue: Color = .bones.background
}

/// Extends `EnvironmentValues` to include the `pageBackgroundColor` property.
public extension EnvironmentValues {
  /// The page background color, which can be set and retrieved via the environment.
  var pageBackgroundColor: Color {
    get { self[PageBackgroundColorKey.self] }
    set { self[PageBackgroundColorKey.self] = newValue }
  }
}
