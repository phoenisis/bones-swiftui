//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 10/11/2023.
//

import SwiftUI

/// A custom button style for the BonesSmallMenu UI component.
///
/// This button style is used to create a small menu button with specific styling and behavior within the Bones UI framework. It conforms to SwiftUI's `ButtonStyle` protocol, allowing it to be applied to any SwiftUI button. The style changes its appearance based on the button's enabled state and provides visual and haptic feedback upon interaction.
///
/// Usage:
/// ```swift
/// Button("Menu", action: { ... })
///   .buttonStyle(BonesSmallMenuButtonFill())
/// ```
///
/// - Note: The style uses the `BonesIcon` and various custom modifiers like `applyButtonMinHeight()` and `.bones()`, which are presumed to be part of the Bones UI framework.
struct BonesSmallMenuButtonFill: ButtonStyle {
  /// The current state of the button's enabled status.
  ///
  /// This environment value determines whether the button is enabled or disabled, and changes the button's appearance accordingly.
  @Environment(\.isEnabled) private var isEnabled
  /// The icon to display in the button.
  ///
  /// Defaults to `.select` if no icon is provided.
  let icon: BonesIconToken = .select

  /// Creates a view representing the body of a button.
  ///
  /// Overrides the `makeBody` method to provide custom styling and behavior for buttons using this style. The style varies based on the button's enabled state, and it includes text styling, icon placement, background, and animations.
  ///
  /// - Parameter configuration: The configuration of the button, including its label and other properties.
  /// - Returns: A view that represents the body of a button.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      HStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        configuration.label
          .textCase(.uppercase)
          .font(.bones(.small))

        BonesIcon(
          icon: .bones(icon),
          renderingMode: .template
        )
        .frame(width: 16, height: 16)
      }
      .minimumScaleFactor(0.5)
      .padding(.vertical, .bones(.medium))
      .padding(.horizontal, .bones(.large))
      .applyButtonMinHeight()
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
      HStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        configuration.label
          .textCase(.uppercase)
          .font(.bones(.small))

        BonesIcon(
          icon: .bones(icon),
          renderingMode: .template
        )
        .frame(width: 16, height: 16)
      }
      .minimumScaleFactor(0.5)
      .padding(.vertical, .bones(.medium))
      .padding(.horizontal, .bones(.large))
      .applyButtonMinHeight()
      .background(
        Capsule(style: .continuous)
          .fill(Color.bones.grey3)
      )
      .foregroundStyle(Color.bones.grey6)
    }
  }
}


struct BonesSmallMenuButtonOutline: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let icon: BonesIconToken = .select

  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      HStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        configuration.label
          .textCase(.uppercase)
          .font(.bones(.small))

        BonesIcon(
          icon: .bones(icon),
          renderingMode: .template
        )
        .frame(width: 16, height: 16)
      }
      .minimumScaleFactor(0.5)
      .padding(.vertical, .bones(.medium))
      .padding(.horizontal, .bones(.large))
      .applyButtonMinHeight()
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
      HStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        configuration.label
          .textCase(.uppercase)
          .font(.bones(.small))

        BonesIcon(
          icon: .bones(icon),
          renderingMode: .template
        )
        .frame(width: 16, height: 16)
      }
      .minimumScaleFactor(0.5)
      .padding(.vertical, .bones(.medium))
      .padding(.horizontal, .bones(.large))
      .applyButtonMinHeight()
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
struct Preview_BonesSmallMenuButton: View {
  var body: some View {
    Section {
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.select(.fill)))
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.select(.fill)))
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.select(.outline)))
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.select(.outline)))
        .disabled(true)

    } header: {
      Text("Select")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesSmallMenuButton()
  }
}
