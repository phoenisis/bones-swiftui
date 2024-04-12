//
//  BackgroundColorKey.swift
//  
//
//  Created by Quentin PIDOUX on 19/03/2024.
//

import SwiftUI

struct BackgroundColorKey: EnvironmentKey {
  static let defaultValue: Color = .bones.background
}

public extension EnvironmentValues {
  var backgroundColor: Color {
    get { self[BackgroundColorKey.self] }
    set { self[BackgroundColorKey.self] = newValue }
  }
}

public extension View {
  func backgroundColor(_ color: Color) -> some View {
    environment(\.backgroundColor, color)
  }
}
