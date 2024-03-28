//
//  UIImage+Transferable.swift
//  
//
//  Created by Quentin PIDOUX on 22/03/2024.
//

import SwiftUI
#if canImport(UIKit)
  import UIKit
#endif

/// Extends `UIImage` to conform to `Transferable` for sharing purposes.
extension UIImage: Transferable {
  /// The representation used for transferring `UIImage` instances.
  public static var transferRepresentation: some TransferRepresentation {

    DataRepresentation(exportedContentType: .png) { image in
      if let pngData = image.pngData() {
        return pngData
      } else {
        throw ConversionError.failedToConvertToPNG
      }
    }
  }

  /// An error type for failed conversion to PNG data.
  enum ConversionError: Error {
    case failedToConvertToPNG
  }
}
