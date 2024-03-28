//
//  IconSizeKey.swift
//  
//
//  Created by Quentin PIDOUX on 25/03/2024.
//

import SwiftUI

struct IconSizeKey: EnvironmentKey {
  static let defaultValue: CGFloat? = nil
}

public extension EnvironmentValues {

  var iconSize: CGFloat? {
    get { self[IconSizeKey.self] }
    set { self[IconSizeKey.self] = newValue }
  }
}

public extension View {

  func iconSize(_ size: BonesIcon.Size?) -> some View {
    environment(\.iconSize, size?.value)
  }

  func iconSize(custom size: CGFloat?) -> some View {
    environment(\.iconSize, size)
  }
}
