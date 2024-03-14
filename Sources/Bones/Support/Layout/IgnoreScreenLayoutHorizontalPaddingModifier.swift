//
//  IgnoreScreenLayoutHorizontalPaddingModifier.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

struct IgnoreScreenLayoutHorizontalPaddingModifier: ViewModifier {
  
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.screenLayoutPadding) var screenLayoutPadding
  
  var limitToSizeClass: UserInterfaceSizeClass?
  
  func body(content: Content) -> some View {
    content
      .padding(.horizontal, horizontalPadding)
  }
  
  var horizontalPadding: CGFloat {
    guard let screenLayoutPadding else { return 0 }
    guard limitToSizeClass == nil || limitToSizeClass == horizontalSizeClass else { return 0 }
    
    return -screenLayoutPadding.horizontal(horizontalSizeClass: horizontalSizeClass)
  }
}

public extension View {
  
  /// Reverts any horizontal padding provided by Orbit `screenLayout` context. Can be optionally limited to a specific horizontal size class.
  ///
  /// A typical usage is to mimic the edge-to-edge appearance of the ``Card`` component.
  func ignoreScreenLayoutHorizontalPadding(limitToSizeClass sizeClass: UserInterfaceSizeClass? = nil) -> some View {
    modifier(IgnoreScreenLayoutHorizontalPaddingModifier(limitToSizeClass: sizeClass))
  }
}
