//
//  ButtonStyles+Large.swift
//
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

/// A large, customizable button that conforms to the `ButtonStyle` protocol.
///
/// This style can conditionally format the button based on whether the button is enabled.
/// The button can also have an optional icon and subtitle.
struct BonesLargeButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let icon: Image.BonesImage?
  let subtitle: String?

  /// Makes and returns the body configuration of the button style.
  ///
  /// - Parameter configuration: The current configuration of the button.
  /// - Returns: A view representing the body of the button.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      VStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        if let icon {
          BonesIcon(
            icon: .bones(icon),
            renderingMode: .template
          )
          .frame(width: 16, height: 16)
        }

        if let subtitle {
          Text(subtitle)
            .font(.bones(.body))
            .minimumScaleFactor(0.5)
        }

        configuration.label
          .font(.bones(.bodyBold))
          .minimumScaleFactor(0.5)
      }
      .padding(.bones(.large))
      .background(Color.bones.primary)
      .foregroundStyle(Color.bones.primaryForeground)
      .cornerRadius(.bones(.small))
      .shadow(
        radius: configuration.isPressed
          ? .bones(.none)
          : .bones(.close)
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
      .applyButtonMinHeight()
    } else {
      VStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        if let icon {
          BonesIcon(
            icon: .bones(icon),
            renderingMode: .template
          )
          .frame(width: 16, height: 16)
        }

        if let subtitle {
          Text(subtitle)
            .font(.bones(.body))
            .minimumScaleFactor(0.5)
        }

        configuration.label
          .font(.bones(.bodyBold))
          .minimumScaleFactor(0.5)
      }
      .padding(.bones(.large))
      .background(Color.bones.grey3)
      .foregroundStyle(Color.bones.grey6)
      .cornerRadius(.bones(.small))
      .applyButtonMinHeight()
    }
  }
}

/// A large, outline-styled button that conforms to the `ButtonStyle` protocol.
///
/// Similar to `BonesLargeButton`, but this style has a distinct outline appearance.
/// The button can also be formatted conditionally based on whether it is enabled.
struct BonesLargeButtonOutline: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let icon: Image.BonesImage?
  let subtitle: String?

  /// Makes and returns the body configuration of the button style.
  ///
  /// - Parameter configuration: The current configuration of the button.
  /// - Returns: A view representing the body of the button.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      VStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        if let icon {
          BonesIcon(
            icon: .bones(icon),
            renderingMode: .template
          )
          .frame(width: 16, height: 16)
        }

        if let subtitle {
          Text(subtitle)
            .font(.bones(.body))
            .minimumScaleFactor(0.5)
        }

        configuration.label
          .font(.bones(.bodyBold))
          .minimumScaleFactor(0.5)
      }
      .padding(.bones(.large))
      .background(Color.bones.white)
      .foregroundStyle(Color.bones.textDark)
      .cornerRadius(.bones(.small))
      .overlay(
        RoundedRectangle(bonesRadius: .bones(.small), style: .continuous)
          .stroke(Color.bones.primary, lineWidth: 1)
      )
      .shadow(
        radius: configuration.isPressed
          ? .bones(.none)
          : .bones(.close)
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
      VStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        if let icon {
          BonesIcon(
            icon: .bones(icon),
            renderingMode: .template
          )
          .frame(width: 16, height: 16)
        }

        if let subtitle {
          Text(subtitle)
            .font(.bones(.body))
            .minimumScaleFactor(0.5)
        }

        configuration.label
          .font(.bones(.bodyBold))
          .minimumScaleFactor(0.5)
      }
      .padding(.bones(.large))
      .background(Color.bones.grey3)
      .foregroundStyle(Color.bones.grey6)
      .cornerRadius(.bones(.small))
    }
  }
}

/// A preview structure for visualizing various states of `BonesLargeButton`.
struct Preview_BonesLargeButton: View {
  var body: some View {
    Section {
      // MARK: Fill
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .fill(
            icon: .add,
            subtitle: "culpa dolor"
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .fill(
            icon: .add,
            subtitle: "culpa dolor"
          )))
        )
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .fill(
            icon: nil,
            subtitle: "culpa dolor"
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .fill(
            icon: nil,
            subtitle: "culpa dolor"
          )))
        )
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .fill(
            icon: nil,
            subtitle: nil
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .fill(
            icon: nil,
            subtitle: nil
          )))
        )
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .fill(
            icon: .add,
            subtitle: nil
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .fill(
            icon: .add,
            subtitle: nil
          )))
        )
        .disabled(true)
      // MARK: Outline
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .outline(
            icon: .add,
            subtitle: "culpa dolor"
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .outline(
            icon: .add,
            subtitle: "culpa dolor"
          )))
        )
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .outline(
            icon: nil,
            subtitle: "culpa dolor"
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .outline(
            icon: nil,
            subtitle: "culpa dolor"
          )))
        )
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .outline(
            icon: nil,
            subtitle: nil
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .outline(
            icon: nil,
            subtitle: nil
          )))
        )
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .outline(
            icon: .add,
            subtitle: nil
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.large(
          .outline(
            icon: .add,
            subtitle: nil
          )))
        )
        .disabled(true)

    } header: {
      Text("Large")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesLargeButton()
  }
}
