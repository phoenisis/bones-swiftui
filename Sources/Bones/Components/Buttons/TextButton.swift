//
//  TextButton.swift
//  
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

/// A button style for creating text buttons in the Bones design system.
///
/// This button style can optionally include an icon along with the text.
struct BonesTextButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  /// An optional icon that appears next to the button’s text.
  let icon: Image.BonesImage?

  /// Creates the view of the button based on the button's configuration.
  /// - Parameter configuration: The current configuration of the button.
  /// - Returns: A view that represents the body of the button.
  func makeBody(configuration: Configuration) -> some View {
    HStack(
      alignment: .center,
      spacing: .bones(.medium)
    ) {
      configuration.label
        .font(.bones(.smallBold))
        .minimumScaleFactor(0.5)

      if let icon {
        Image(.bones(icon))
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(width: 16, height: 16)
          .foregroundColor(Color.bones.primaryForeground)
      }
    }
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed
    )
    .animation(.default, value: configuration.isPressed)
    .changeEffect(
      .feedback(
        hapticImpact: .light
      ),
      value: configuration.isPressed
    )
    .applyButtonMinHeight()
  }
}

/// A preview struct to visualize the `BonesTextButton` button style in different states.
struct Preview_BonesButtonText: View {
  var body: some View {
    Section {
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.text(icon: nil)))

      Button("Laborum aliquip velit consequat ex tempor enim amet elit reprehenderit pariatur voluptate.") {}
        .buttonStyle(.bones(.text(icon: .chevronRight)))

    } header: {
      Text("Textes")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesButtonText()
  }
}
