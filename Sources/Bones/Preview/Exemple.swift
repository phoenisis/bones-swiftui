//
//  Exemple.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

struct SwiftUIViewTest: View {
  var body: some View {
    Button("Hello, world!", action: {})
      .buttonStyle(.bones(.small(.fill)))

    Text("")
      .bold()
  }

  init() {
    Bones.update(.color(.primary, withColor: "#f7bc6f"))
    Bones.update(.spacing(.medium, withPading: 64))
  }
}


#Preview {
  SwiftUIViewTest()
}
