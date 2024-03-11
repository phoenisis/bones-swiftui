//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 30/11/2023.
//

import SwiftUI

/// An extension on `View` to conditionally modify it.
extension View {
  /// Applies a modification to the view if a certain condition is met.
  ///
  /// Use this method to conditionally apply changes to a view. The `modify` method
  /// takes a closure (`transform`) that returns an optional `View`. If the closure
  /// returns a non-nil view, that view is used; otherwise, the original view is used.
  ///
  /// The `@ViewBuilder` attribute allows for SwiftUI's view builder syntax within the closure,
  /// enabling the use of standard SwiftUI view constructs and conditionals.
  ///
  /// - Parameters:
  ///   - transform: A closure that takes the current view as its parameter and returns an
  ///     optional modified view.
  ///
  /// - Returns: A view that is either the result of the transformation if the closure returns
  ///   a non-nil view, or the original view if the closure returns nil.
  ///
  /// - Example:
  ///   Here's how you can use `modify` to conditionally apply a font weight to a `Text` view:
  ///```swift
  ///   Text("Hello, world!")
  ///       .fontWeight(.black)
  ///```
  ///```swift
  ///   Text("Hello, world!")
  ///       .modify {
  ///       .fontWeight(.black)
  ///```
  @ViewBuilder
  func modify(@ViewBuilder _ transform: (Self) -> (some View)?) -> some View {
    if let view = transform(self), !(view is EmptyView) {
      view
    } else {
      self
    }
  }
}

extension View where Self: ShapeStyle {
  /// Applies a modification to the view if it conforms to `ShapeStyle`.
  ///
  /// This method is specifically designed for views that conform to `ShapeStyle`.
  /// The `modify` method takes a closure (`transform`) that returns an optional `View`.
  /// If the closure returns a non-nil view, that view is used; otherwise, the original view is used.
  ///
  /// The `@ViewBuilder` attribute allows for SwiftUI's view builder syntax within the closure,
  /// enabling the use of standard SwiftUI view constructs and conditionals.
  ///
  /// - Parameters:
  ///   - transform: A closure that takes the current view as its parameter and returns an
  ///     optional modified view.
  ///
  /// - Returns: A view that is either the result of the transformation if the closure returns
  ///   a non-nil view, or the original view if the closure returns nil.
  ///
  /// - Example:
  ///   Here's how you can use `modify` to conditionally apply a style to a `Shape` view:
  ///```swift
  ///   Rectangle()
  ///       .fill(Color.blue)
  ///```
  ///```swift
  ///   Circle()
  ///       .fill(Color.red)
  ///       .stroke(Color.black, lineWidth: 4)
  ///```
  @ViewBuilder
  func modify(@ViewBuilder _ transform: (Self) -> (some View)?) -> some View {
    if let view = transform(self), !(view is EmptyView) {
      view
    } else {
      self
    }
  }
}
