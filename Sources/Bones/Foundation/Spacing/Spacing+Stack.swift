//
//  Spacing+Stack.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

public extension HStack {
  /// Initializes an HStack with spacing based on the BonesPadding value.
  ///
  /// - Parameters:
  ///   - alignment: Alignment of the stack.
  ///   - spacing: The spacing value as `BonesPadding`.
  ///   - content: The content within the stack.
  ///
  init(
    alignment: VerticalAlignment = .center,
    spacing: BonesSpacing,
    @ViewBuilder content: () -> Content
  ) {
    switch spacing {
      case .bones(let bonesPaddingToken):
        self.init(alignment: alignment, spacing: CGFloat(bonesPaddingToken.value), content: content)
    }
  }
}

public extension VStack {
  /// Initializes a VStack with spacing based on the BonesPadding value.
  ///
  /// - Parameters:
  ///   - alignment: Alignment of the stack.
  ///   - spacing: The spacing value as `BonesPadding`.
  ///   - content: The content within the stack.
  ///
  init(
    alignment: HorizontalAlignment = .center,
    spacing: BonesSpacing,
    @ViewBuilder content: () -> Content
  ) {
    switch spacing {
      case .bones(let bonesPaddingToken):
        self.init(alignment: alignment, spacing: CGFloat(bonesPaddingToken.value), content: content)
    }

  }
}
