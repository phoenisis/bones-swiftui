  //
  //  foundation.swift
  //
  //
  //  Created by Quentin PIDOUX on 13/03/2024.
  //

import SwiftUI

  /// A class responsible for initializing and managing the theme of the application.
public final class Bones {
    /// Initializes the application's theme with custom colors and spacing.
    ///
    /// This method allows for the setting of a global color and spacing scheme at the start
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
  
    /// Overrides the current spacing values with new values.
    ///
    /// Similar to `overrideColors`, this method enables dynamic updates to the application's
    /// spacing scheme. It supports real-time adjustments to layout and spacing based on
    /// user interactions or preferences.
    ///
    /// - Parameter spacing: A dictionary mapping `CGFloat.BonesSpacing` to spacing values.
  public class func overrideSpacings(_ spacing: [CGFloat.BonesSpacing: CGFloat]) {
    bonesSpacings = spacing
  }
}
