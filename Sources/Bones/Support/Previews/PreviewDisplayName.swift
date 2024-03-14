//
//  PreviewDisplayName.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

public extension View {

  /// Sets a name to show in the canvas for a preview, based on the enclosing preview property name.
  @ViewBuilder func previewDisplayName(name: String = #function) -> some View {
    if let name = name.components(separatedBy: "__").last {
      previewDisplayName(name.wordsFromCamelCase)
    } else {
      self
    }
  }
}

private extension String {

  var wordsFromCamelCase: String {
    map { ($0.isUppercase ? " " : "") + String($0) }
      .joined()
      .trimmingCharacters(in: .whitespaces)
  }
}
