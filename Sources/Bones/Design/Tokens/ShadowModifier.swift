//
//  ShadowModifier.swift
//  
//
//  Created by Quentin PIDOUX on 26/09/2023.
//

import SwiftUI

/// Enum representing the styles of shadows that can be applied to a view.
public enum BonesShadowStyle {
  case bones(ShadowToken)
}
/// Enum representing various shadow styles such as none, close, and far.
public enum ShadowToken: Int, CaseIterable, Identifiable {
  case none   // No shadow.
  case reallyClose  // A shadow that's really close to the view.
  case close  // A shadow that's close to the view.
  case medium  // A shadow that's close to the view.
  case far    // A shadow that's far from the view.

  public var id: String {
    switch self {
      case .none:
        return "none"
      case .reallyClose:
        return "reallyClose"
      case .close:
        return "close"
      case .medium:
        return "medium"
      case .far:
        return "far"
    }
  }
}

fileprivate extension View {
  /// Applies a shadow to the view.
  ///
  /// - Parameters:
  ///   - type: The type of shadow as defined in `ShadowToken`.
  ///   - color: The color to be applied to the shadow.
  ///
  /// - Returns: A view modified with a shadow.
  func shadowed(_ type: ShadowToken, color: Color) -> some View {
    switch type {
      case .none:
        return self.shadow(
          color: .clear,
          radius: 0,
          x: 0, y: 0
        )
      case .reallyClose:
        return self.shadow(
          color: color.opacity(0.15),
          radius: 2,
          x: 0, y: 2
        )
      case .close:
        return self.shadow(
          color: color.opacity(0.15),
          radius: 4,
          x: 0, y: 4
        )
      case .medium:
        return self.shadow(
          color: color.opacity(0.16),
          radius: 8,
          x: 0, y: 8
        )
      case .far:
        return self.shadow(
          color: color.opacity(0.25),
          radius: 16,
          x: 0, y: 8
        )
    }
  }
}

fileprivate struct ShadowModifier: ViewModifier {
  let type: ShadowToken  // The type of shadow to apply.
  let color: Color      // The color of the shadow.

  /// Modifier to apply shadow to a view.
  ///
  /// - Parameters:
  ///   - content: The view to which the shadow will be applied.
  ///
  /// - Returns: Modified view with an applied shadow.
  init(type: ShadowToken, color: Color) {
    self.type = type
    self.color = color
  }

  /// Modifies the provided content with the shadow.
  ///
  /// - Parameter content: The content to be modified.
  /// - Returns: The modified content with the shadow applied.
  func body(content: Content) -> some View {
    content
      .shadowed(type, color: color)
  }
}

// MARK: - View Extension
public extension View {
  /// Applies a shadow of specified style and color to the view.
  ///
  /// - Parameters:
  ///   - color: Color of the shadow. Defaults to `.black`.
  ///   - radius: Style of the shadow, defined in `BonesShadowStyle`. Defaults to `.bones(.close)`.
  ///
  /// - Returns: A view with an applied shadow.
  func shadow(color: Color = Color.bones.black,
              radius: BonesShadowStyle = .bones(.close)) -> some View {
    switch radius { case let .bones(token ):
        return self
          .modifier(ShadowModifier(type: token, color: color))
    }
  }
}

// MARK: ShadowStyle
// Additional utility to handle different shadow styles.
public extension ShadowStyle {
  struct bones {
    public static func drop(_ style: ShadowToken) -> ShadowStyle {
      return switch style {
        case .none:
          ShadowStyle.drop(color: .clear, radius: 0)
        case .reallyClose:
          ShadowStyle.drop(color: .bones.black.opacity(0.15), radius: 2, x: 0, y: 2)
        case .close:
          ShadowStyle.drop(color: .bones.black.opacity(0.15), radius: 4, x: 0, y: 4)
        case .medium:
          ShadowStyle.drop(color: .bones.black.opacity(0.15), radius: 8, x: 0, y: 8)
        case .far:
          ShadowStyle.drop(color: .bones.black.opacity(0.25), radius: 16, x: 0, y: 8)
      }
    }

    public static func inner(_ style: ShadowToken) -> ShadowStyle {
      return switch style {
        case .none:
          ShadowStyle.inner(color: .clear, radius: 0)
        case .reallyClose:
          ShadowStyle.inner(color: .bones.black.opacity(0.15), radius: 2, x: 0, y: 2)
        case .close:
          ShadowStyle.inner(color: .bones.black.opacity(0.15), radius: 4, x: 0, y: 4)
        case .medium:
          ShadowStyle.inner(color: .bones.black.opacity(0.15), radius: 8, x: 0, y: 8)
        case .far:
          ShadowStyle.inner(color: .bones.black.opacity(0.25), radius: 16, x: 0, y: 8)
      }
    }
  }
}

// MARK: - Preview
// Previews for different shadow styles.
fileprivate struct ShadowPreview: View {
  var shadowType: ShadowToken
  var name: String

  var body: some View {
    HStack {
      Text(name)
        .font(.custom(.bones(.body)))
      Spacer()
      Rectangle()
        .foregroundStyle(
          Color.bones.primary
            .shadow(.bones.drop(shadowType))
        )
        .frame(width: 50, height: 50)

      Rectangle()
        .foregroundStyle(
          Color.bones.white
            .shadow(.bones.inner(shadowType))
        )
        .frame(width: 50, height: 50)
    }
    .previewDisplayName(name)
  }
}

struct Preview_Shadows: View {
  var body: some View {
    List {
      ForEach(ShadowToken.allCases) { shadow in
        ShadowPreview(shadowType: shadow, name: shadow.id)
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_Shadows()
}
