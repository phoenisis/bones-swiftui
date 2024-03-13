//
//  Screenshot.swift
//
//
//  Created by Quentin PIDOUX on 22/01/2024.
//

import UIKit

/// Extends `UIView` to include a screenshot capability.
public extension UIView {
  /// A computed property that generates a screenshot of the view.
  ///
  /// This property captures the current visual appearance of the view and returns
  /// it as a `UIImage`. This can be useful for creating visual snapshots of views
  /// at runtime for sharing, saving, or other processing.
  ///
  /// - Returns: An optional `UIImage` representing the screenshot of the view. Returns `nil` if the
  ///            screenshot process fails.
  var screenshot: UIImage? {
    UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
    defer {
      UIGraphicsEndImageContext()
    }
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    layer.render(in: context)
    return UIGraphicsGetImageFromCurrentImageContext()
  }
}
