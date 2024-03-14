//
//  SmallButton.swift
//
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

/// A button style for creating small buttons with a filled background in the Bones design system.
struct BonesSmallButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  /// Creates the view of the button based on the button's configuration.
  /// - Parameter configuration: The current configuration of the button.
  /// - Returns: A view that represents the body of the button.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      configuration.label
        .textCase(.uppercase)
        .font(.bones(.small))
        .minimumScaleFactor(0.5)
        .padding(.vertical, .bones(.medium))
        .padding(.horizontal, .bones(.large))
        .background(
          Capsule(style: .continuous)
            .fill(Color.bones.primary)
        )
        .foregroundStyle(Color.bones.primaryForeground)
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
    } else {
      configuration.label
        .textCase(.uppercase)
        .font(.bones(.small))
        .minimumScaleFactor(0.5)
        .padding(.vertical, .bones(.medium))
        .padding(.horizontal, .bones(.large))
        .background(
          Capsule(style: .continuous)
            .fill(Color.bones.grey3)
        )
        .foregroundStyle(Color.bones.grey6)
    }
  }
}

/// A button style for creating small buttons with an outlined background in the Bones design system.
struct BonesSmallButtonOutline: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  /// Creates the view of the button based on the button's configuration.
  /// - Parameter configuration: The current configuration of the button.
  /// - Returns: A view that represents the body of the button.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      configuration.label
        .textCase(.uppercase)
        .font(.bones(.small))
        .minimumScaleFactor(0.5)
        .padding(.vertical, .bones(.medium))
        .padding(.horizontal, .bones(.large))
        .foregroundStyle(Color.bones.textDark)
        .background(
          Capsule(style: .continuous)
            .fill(Color.bones.white)
            .overlay(
              Capsule(style: .continuous)
                .stroke(Color.bones.primary, lineWidth: 1)
            )
        )
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
    } else {
      configuration.label
        .textCase(.uppercase)
        .font(.bones(.small))
        .minimumScaleFactor(0.5)
        .padding(.vertical, .bones(.medium))
        .padding(.horizontal, .bones(.large))
        .foregroundStyle(Color.bones.grey6)
        .background(
          Capsule(style: .continuous)
            .fill(Color.bones.grey3)
            .overlay(
              Capsule(style: .continuous)
                .stroke(Color.bones.grey6, lineWidth: 1)
            )
        )
    }
  }
}

/// A preview struct to visualize the `BonesSmallButton` and `BonesSmallButtonOutline` button styles in different states.
struct Preview_BonesSmallButton: View {
  var body: some View {
    Section {
      Button("cillum non incididunt enim") {}
        .buttonStyle(BonesSmallMenuButtonOutline())
      Button("cillum non incididunt enim") {}
        .buttonStyle(BonesSmallMenuButtonOutline())
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.small(.fill)))

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.small(.fill)))
        .disabled(true)

      Button("Laborum aliquip velit consequat ex tempor enim amet elit reprehenderit pariatur voluptate.") {}
        .buttonStyle(.bones(.small(.outline)))

      Button("Laborum aliquip velit consequat ex tempor enim amet elit reprehenderit pariatur voluptate.") {}
        .buttonStyle(.bones(.small(.outline)))
        .disabled(true)

    } header: {
      Text("Small")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesSmallButton()
  }
}
