//
//  PreviewWrapper.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

/// Registers Bones fonts for preview content.
public struct BonesPreviewWrapper<Content: View>: View {

  @ViewBuilder let content: Content

  public var body: some View {
    content
  }

  public init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
}

typealias PreviewWrapper = BonesPreviewWrapper
