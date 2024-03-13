//
//  Spacing+Padding.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

extension View {
  /// Applies padding to the view based on the BonesPadding value.
  ///
  /// - Parameter bonesLength: The padding value as `BonesPadding`.
  ///
  /// - Returns: A view with applied padding.
  @inlinable public func padding(_ bonesLength: BonesSpacing) -> some View {
    switch bonesLength {
      case .bones(let size):
        return self
          .padding(size.value)
    }
  }

  /// Applies padding to specific edges of the view based on the BonesPadding value.
  ///
  /// - Parameters:
  ///   - edges: The edges where the padding should be applied.
  ///   - bonesLength: The padding value as `BonesPadding`.
  ///
  /// - Returns: A view with applied padding to specific edges.
  @inlinable public func padding(_ edges: Edge.Set = .all, _ bonesLength: BonesSpacing) -> some View {
    switch bonesLength {
      case .bones(let size):
        return self
          .padding(edges, size.value)
    }
  }

  /// Applies corner radius to the view based on the BonesRadius value.
  ///
  /// - Parameters:
  ///   - bonesRadius: The corner radius value as `BonesRadius`.
  ///   - antialiased: A Boolean value that determines whether the corner radius should be antialiased.
  ///
  /// - Returns: A view with applied corner radius.
  public func cornerRadius(_ bonesRadius: BonesRadius, antialiased: Bool = true) -> some View {
    switch bonesRadius {
      case .bones(let size):
        return self
          .cornerRadius(
            size.rawValue,
            antialiased: antialiased
          )
    }
  }
}
