//
//  ListModifier.swift
//  
//
//  Created by Quentin PIDOUX on 16/10/2023.
//

import SwiftUI

/// An extension to SwiftUI's `View` to allow the customization of the background color of a list.
public extension View {
  /// Modifies the background color of the list.
  ///
  /// This modifier allows you to easily change the background color of a list or scroll view.
  /// It accepts a `BonesColor` as an argument, which is then used to set the background color.
  ///
  /// - Parameter color: A `BonesColor` representing the background color to be applied.
  ///                    Defaults to `.bones(.background)`.
  /// - Returns: A modified view having the specified background color.
  ///
  /// Example:
  /// ```swift
  /// List {
  ///     Text("Item 1")
  ///     Text("Item 2")
  /// }
  /// .listBackgroundColor(.bones(.customColor))
  /// ```
  @ViewBuilder func listBackgroundColor(_ color: BonesColor = .bones(.background)) -> some View {
    self.background(Color(color))
      .scrollContentBackground(.hidden)
  }
}
