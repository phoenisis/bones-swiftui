//
//  ToggleStyle.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

/// Provides a mechanism to apply specific styles to `Toggle` views.
extension View {
  /// Applies a style to a `Toggle` element.
  ///
  /// This function allows a specific toggle style to be applied based on a style token.
  /// It extends any `Toggle` that has a `Text` label.
  ///
  /// - Parameter bonesStyle: The `BonesTogglesStyles` enum case that determines which style to apply.
  /// - Returns: A view that represents the styled toggle.
  public func toggleStyle(_ bonesStyle: BonesTogglesStyles) -> some View where Self == Toggle<Text> {
    switch bonesStyle {
      case .bones(let bonesTogglesStyleToken):
        switch bonesTogglesStyleToken {
          case .legal:
            return AnyView(self.toggleStyle(CheckmarkToggleStyle()))
        }
    }
  }
}
