//
//  SwiftUIView.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

struct SwiftUIViewTest: View {
  var body: some View {
    Button("Hello, world!", action: {})
      .buttonStyle(.bones(.small(.fill)))
  }

  init() {
    Bones.overrideColor(.primary, with: "#f7bc6f")
    Bones.overrideSpacing(.medium, with: 64)
  }
}


#Preview {
  SwiftUIViewTest()
}
