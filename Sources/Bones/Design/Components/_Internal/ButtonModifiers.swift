//
//  ButtonModifiers.swift
//  
//
//  Created by Quentin PIDOUX on 25/10/2023.
//

import SwiftUI

/// `ButtonMinHeightModifier` is a `ViewModifier` that ensures the applied view has a minimum height.
///
/// By applying this modifier, you can make sure that tappable areas like buttons meet accessibility standards.
fileprivate struct ButtonMinHeightModifier: ViewModifier {
  /// A customizable minimum height value.
  var minHeight: CGFloat

  /// Modifies the input view by applying a minimum height.
  ///
  /// - Parameter content: The view that will receive the modification.
  /// - Returns: The modified view with the applied minimum height.
  func body(content: Content) -> some View {
    content
      .frame(minHeight: minHeight, alignment: .center) // Applying the minimum height to the content.
      .accessibilityAddTraits(.isButton) // Ensuring the modified view is recognized as a button for accessibility.
  }
}

extension View {
  /// Applies a minimum height to a view, making it more accessible, especially for tappable views like buttons.
  ///
  /// - Parameter minHeight: The minimum height to be applied to the view. Default value is 44.
  /// - Returns: The view modified with a minimum height.
  public func applyButtonMinHeight(minHeight: CGFloat = 44) -> some View {
    self.modifier(
      ButtonMinHeightModifier(minHeight: minHeight)
    )
  }
}
