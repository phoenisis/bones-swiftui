//
//  Foundation.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

/// A class responsible for initializing and managing the theme of the application.
public final class Bones {
  /// Initializes the application's theme with custom colors and spacing.
  ///
  /// This constructor allows for the setting of a global color and spacing scheme at the start
  /// of the application. It can be called during the application's initialization phase
  /// to ensure that the custom themes are applied throughout the app.
  ///
  /// - Parameters:
  ///   - colors: A dictionary mapping `Color.BonesColorToken` to hex color strings.
  ///   - spacing: A dictionary mapping `CGFloat.BonesSpacing` to spacing values.
  public init(
    colors: [Color.BonesColorToken: String] = [:],
    spacing: [CGFloat.BonesSpacing: CGFloat] = [:]
  ) {
    bonesColors = colors
    bonesSpacings = spacing
  }
  
  /// Overrides the current color scheme with a new set of colors.
  ///
  /// This method allows for dynamic changes to the application's color scheme after
  /// initial setup. It can be used to implement theme switching or to update colors
  /// based on user preferences.
  ///
  /// - Parameter colors: A dictionary mapping `Color.BonesColorToken` to hex color strings.
  public class func overrideColors(_ colors: [Color.BonesColorToken: String]) {
    bonesColors = colors
  }
  
  /// Overrides a specific color token with a new hex value.
  ///
  /// This allows for fine-grained control over the color scheme, enabling dynamic changes
  /// to individual colors.
  ///
  /// - Parameters:
  ///   - color: The `Color.BonesColorToken` to override.
  ///   - hexValue: The new hex color string.
  public class func overrideColor(_ color: Color.BonesColorToken, with hexValue: String) {
    bonesColors[color] = hexValue
  }
  
  /// Overrides the current spacing values with new values.
  ///
  /// Similar to `overrideColors`, this method enables dynamic updates to the application's
  /// spacing scheme. It supports real-time adjustments to layout and spacing based on
  /// user interactions or preferences.
  ///
  /// - Parameter spacings: A dictionary mapping `CGFloat.BonesSpacing` to spacing values.
  public class func overrideSpacings(_ spacings: [CGFloat.BonesSpacing: CGFloat]) {
    bonesSpacings = spacings
  }
  
  /// Overrides a specific spacing token with a new value.
  ///
  /// This allows for precise adjustments to the layout spacing, facilitating real-time
  /// updates and customizations.
  ///
  /// - Parameters:
  ///   - spacing: The `CGFloat.BonesSpacing` to override.
  ///   - value: The new spacing value as a `CGFloat`.
  public class func overrideSpacing(_ spacing: CGFloat.BonesSpacing, with value: CGFloat) {
    bonesSpacings[spacing] = value
  }
}
