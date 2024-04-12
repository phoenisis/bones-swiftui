//
//  Separator.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

/// Bones component that displays vertical separator between content.
///
/// A ``Separator`` consists of an optional label.
///
/// ```swift
/// Separator("OR", thickness: .hairline)
/// ```
///
/// ### Customizing appearance
///
/// The label color can be modified by ``textColor(_:)`` modifier.
///
/// ```swift
/// Separator("OR")
///     .textColor(.blueLight)
/// ```
///
/// ### Layout
///
/// Component expands horizontally.
///
/// - Note: [Bones.kiwi documentation](https://Bones.kiwi/components/structure/separator/)
public struct Separator: View {
  
  @Environment(\.textColor) private var textColor
  
  private let label: String
  private let color: Color
  private let thickness: CGFloat
  
  public var body: some View {
    if label.isEmpty {
      line
    } else {
      HStack(spacing: .bones(.small)) {
        leadingLine
        
        Text(label)
          .font(.custom(.bones(.body)))
          .textColor(textColor)
          .fontWeight(.medium)
          .multilineTextAlignment(.center)
          .layoutPriority(1)
        
        trailingLine
      }
    }
  }
  
  @ViewBuilder private var line: some View {
    color
      .frame(height: thickness)
  }
  
  @ViewBuilder private var leadingLine: some View {
    HStack(spacing: 0) {
      line
      LinearGradient(colors: [color, color.opacity(0)], startPoint: .leading, endPoint: .trailing)
        .frame(width: .BonesSpacing.large.value)
        .frame(height: thickness)
    }
  }
  
  @ViewBuilder private var trailingLine: some View {
    HStack(spacing: 0) {
      LinearGradient(colors: [color, color.opacity(0)], startPoint: .trailing, endPoint: .leading)
        .frame(width: .BonesSpacing.large.value)
        .frame(height: thickness)
      line
    }
  }
}

// MARK: - Inits
public extension Separator {
  
  /// Creates Bones ``Separator`` component.
  init(
    _ label: String = "",
    color: Color = .bones.grey4,
    thickness: Thickness = .default
  ) {
    self.label = label
    self.color = color
    self.thickness = thickness.value
  }
}

// MARK: - Types
public extension Separator {
  
  /// Bones ``Separator`` thickness.
  enum Thickness {
    case `default`
    case hairline
    case custom(CGFloat)
    
    /// Value of Bones `Separator` ``Separator/Thickness``.
    public var value: CGFloat {
      switch self {
        case .`default`:            return 1
        case .hairline:             return .hairline
        case .custom(let value):    return value
      }
    }
  }
}

// MARK: - Previews
struct SeparatorPreviews: PreviewProvider {
  
  public static var previews: some View {
    PreviewWrapper {
      standalone
      labels
      mix
    }
    .padding(.vertical, .bones(.medium))
    .previewLayout(.sizeThatFits)
  }
  
  static var standalone: some View {
    Separator()
      .previewDisplayName()
  }
  
  static var labels: some View {
    VStack(spacing: .bones(.large)) {
      Separator()
      Separator("Separator with label")
    }
    .previewDisplayName()
  }
  
  static var mix: some View {
    VStack(spacing: .bones(.large)) {
      Separator("Custom colors", color: .bones.primary)
        .textColor(.bones.textDark)
      Separator("Separator with very very very very very long and multiline label")
      Separator("Hairline thickness", thickness: .hairline)
      Separator("Custom thickness", thickness: .custom(.BonesSpacing.small.value))
    }
    .previewDisplayName()
  }
  
  static var snapshot: some View {
    labels
      .padding(.vertical, .bones(.medium))
  }
}
