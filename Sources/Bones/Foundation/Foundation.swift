//
//  Foundation.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

/// A class responsible for initializing and managing the theme of the application.
public final class Bones {  
  /// Sets the initial color and spacing scheme for the application.
  /**
   Establishes the foundational theme for your app by defining the color tokens
   and spacing values used throughout.

   - Parameters:
   - colors: A dictionary mapping `Color.BonesColorToken` to hex color strings
   (defaults to an empty dictionary).
   - spacing: A dictionary mapping `CGFloat.BonesSpacing` to spacing values
   (defaults to an empty dictionary).
   */
  public class func configure(
    colors: [Color.BonesColorToken: String] = [:],
    spacing: [CGFloat.BonesSpacing: CGFloat] = [:]
  ) {
    BonesConfig.colors = colors
    BonesConfig.spacings = spacing
  }

  /// Overrides specific color tokens or spacing values.
  /**
   Allows for adjustments to the application's theme after the initial configuration.
   Use this method to update specific color tokens or spacing values.

   - Parameter type: An `OverrideType` specifying the modification to be made.
   */
  public class func update(_ type: Bones.ThemeComponent) {
    Task { @MainActor in
      switch type {
        case let .colors(colors):
          BonesConfig.colors.merge(colors) { _, new  in new }
        case let .color(color, value):
          BonesConfig.colors[color] = value
        case let .spacings(spacings):
          BonesConfig.spacings.merge(spacings) { _, new  in new }
        case let .spacing(spacing, value):
          BonesConfig.spacings[spacing] = value
      }
    }
  }

  // Accessors for color tokens and spacing values can be added here
  // if needed in your app.
  public enum ThemeComponent {
    case colors([Color.BonesColorToken: String])
    case color(Color.BonesColorToken, withColor: String)
    case spacings([CGFloat.BonesSpacing: CGFloat])
    case spacing(CGFloat.BonesSpacing, withPading: CGFloat)
  }
}

struct Test: View {
  var body: some View {
    Rectangle()
      .fill(Color.blue.shadow(.bones.drop(.close)))
  }
}
