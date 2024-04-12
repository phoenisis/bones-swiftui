//
//  DefaultButton.swift
//  
//
//  Created by Quentin PIDOUX on 11/04/2024.
//

import SwiftUI

/// A button style for creating text buttons in the Bones design system.
///
/// This button style can optionally include an icon along with the text.
struct BonesDefaultTextButton: ButtonStyle {
  let lineNumber: Int?

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .lineLimit(lineNumber)
      .font(.custom(.bones(.body)))
      .conditionalEffect(
        .pushDown,
        condition: configuration.isPressed
      )
      .changeEffect(
        .feedback(
          hapticImpact: .light
        ),
        value: configuration.isPressed
      )
  }
}

/// A preview struct to visualize the `BonesTextButton` button style in different states.
struct Preview_BonesDefaultButton: View {
  var body: some View {
    Section {
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.defaultText(nil)))
    } header: {
      Text("Default")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesDefaultButton()
  }
}
