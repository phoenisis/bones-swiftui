//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 22/01/2024.
//

import UIKit

public extension UIView {
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
