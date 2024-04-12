//
//  BorderWidth.swift
//
//
//  Created by Quentin PIDOUX on 12/03/2024.
//

import CoreGraphics
#if canImport(UIKit)
  import UIKit
#endif

/// Predefiend Bones border widths.
public enum BorderWidth {
  /// 1 pixel border width.
#if canImport(UIKit)
  public static let hairline: CGFloat = 1.0 / UIScreen.main.scale
#else
  public static let hairline: CGFloat = 1.0 // Fallback or alternative calculation
#endif
  /// 0.5 pt border width.
  public static let thin: CGFloat = 0.5
  /// A default 1 pt border.
  public static let `default`: CGFloat = 1.0
  /// 2 pt border width used for actively selected or highlighted components.
  public static let active: CGFloat = 2.0
}

public extension CGFloat {
  /// 1 pixel size.
  static let hairline: Self = BorderWidth.hairline
}
