//
//  SharableViewModifier.swift
//  
//
//  Created by Quentin PIDOUX on 22/03/2024.
//

import SwiftUI
import UIKit

/// An extension on `View` to easily apply the sharing modifier.
public extension View {
  /// Applies the `SnapAndShareView` modifier to enable sharing of the view's snapshot.
  ///
  /// - Parameter previewText: An optional text to be used as a label or preview.
  /// - Returns: A view modified to include sharing functionality.
  func sharable(_ previewText: String? = nil) -> some View {
    modifier(SnapAndShareView(previewText: previewText))
  }
}

/// A `ViewModifier` to add sharing functionality to a SwiftUI view.
struct SnapAndShareView: ViewModifier {
  let previewText: String?

  public func body(content: Content) -> some View {
    if let image = content.snapshot() {
      content
        .overlay(alignment: .topTrailing) {
          ShareLink(
            item: image,
            preview: SharePreview(previewText ?? "", image: image)
          ) {
            Button(""){}
              .buttonStyle(.bones(.navBar(.icon(.share))))
              .padding(.bones(.medium))
              .allowsTightening(false)
          }
          .zIndex(5)
        }
    } else {
      content
    }
  }
}

/// An extension on `View` to add snapshot functionality, allowing SwiftUI views to be rendered as `UIImage`.
extension View {
  /// Generates a snapshot image of the current view.
  ///
  /// - Parameter scale: The scale factor to apply to the snapshot. Defaults to the screen's scale.
  /// - Returns: An optional `UIImage` representing the snapshot of the view.
  @MainActor
  func snapshot(scale: CGFloat? = nil) -> UIImage? {
    let renderer = ImageRenderer(content: self)
    renderer.scale = scale ?? UIScreen.main.scale
    return renderer.uiImage
  }
}
