//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 09/11/2023.
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
            return AnyView(self.toggleStyle(ConsentToggleStyle()))
        }
    }
  }
}


/// Defines the possible styles that can be applied to `Toggle` elements.
public enum BonesTogglesStyles { case bones(BonesTogglesStyleToken) }

/// A token that represents a specific style for toggles.
public enum BonesTogglesStyleToken {
  case legal
}

