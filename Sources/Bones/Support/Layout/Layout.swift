//
//  Layout.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

public enum Layout {

  /// Maximum readable width used for Bones layout in regular width environment.
  public static var readableMaxWidth: CGFloat = 672
}

public extension Alignment {

  init(_ horizontalAlignment: HorizontalAlignment) {
    switch horizontalAlignment {
      case .leading:          self = .left
      case .trailing:         self = .right
      default:                self = .center
    }
  }
}
