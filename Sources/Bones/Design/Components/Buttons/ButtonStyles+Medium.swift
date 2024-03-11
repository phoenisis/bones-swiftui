//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

/// A medium-sized button style with various display options.
///
/// This button style can optionally display an icon.
/// The appearance adapts based on whether the button is enabled or pressed.
struct BonesMediumButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let icon: BonesIconToken?

  /// Creates the view of the button based on its configuration.
  ///
  /// - Parameter configuration: The current button configuration.
  /// - Returns: A view that displays the button content.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      HStack(
        alignment: .center,
        spacing: .bones(.large)
      ) {
        configuration.label
          .textCase(.uppercase)
          .font(.bones(.body))
        if let icon {
          BonesIcon(
            icon: .bones(icon),
            renderingMode: .template
          )
          .frame(width: 24, height: 24)
        }
      }
      .padding(.vertical, .bones(.medium))
      .padding(.horizontal, .bones(.large))
      .applyButtonMinHeight()
      .background(
        RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
          .fill(Color.bones.primary)
      )
      .foregroundStyle(Color.bones.primaryForeground)
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
      .animation(.default, value: configuration.isPressed)
      .minimumScaleFactor(0.5)
    } else {
      HStack(
        alignment: .center,
        spacing: .bones(.large)
      ) {
        configuration.label
          .textCase(.uppercase)
          .font(.bones(.body))
          .minimumScaleFactor(0.5)
        if let icon {
          BonesIcon(
            icon: .bones(icon),
            renderingMode: .template
          )
          .frame(width: 24, height: 24)
        }
      }
      .padding(.vertical, .bones(.medium))
      .padding(.horizontal, .bones(.large))
      .applyButtonMinHeight()
      .background(
        RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
          .fill(Color.bones.grey3)
      )
      .foregroundStyle(Color.bones.grey6)
    }
  }
}

/// An outlined variant of the medium-sized button style.
///
/// This button style has a border and different background compared to `BonesMediumButton`,
/// while maintaining similar display options such as icon and subtitle.
struct BonesMediumButtonOutline: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let icon: BonesIconToken?

  /// Creates the view of the button based on its configuration.
  ///
  /// - Parameter configuration: The current button configuration.
  /// - Returns: A view that displays the button content.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      HStack(
        alignment: .center,
        spacing: .bones(.large)
      ) {
        configuration.label
          .textCase(.uppercase)
          .font(.bones(.body))
          .minimumScaleFactor(0.5)
        if let icon {
          BonesIcon(
            icon: .bones(icon),
            renderingMode: .template
          )
          .frame(width: 24, height: 24)
        }
      }
      .padding(.vertical, .bones(.medium))
      .padding(.horizontal, .bones(.large))
      .applyButtonMinHeight()
      .foregroundStyle(Color.bones.textDark)
      .background(
        RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
          .fill(Color.bones.white)
          .overlay(
            RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
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
        spacing: .bones(.large)
      ) {
        configuration.label
          .textCase(.uppercase)
          .font(.bones(.body))
          .minimumScaleFactor(0.5)

        if let icon {
          BonesIcon(
            icon: .bones(icon),
            renderingMode: .template
          )
          .frame(width: 24, height: 24)
        }
      }
      .padding(.vertical, .bones(.medium))
      .padding(.horizontal, .bones(.large))
      .applyButtonMinHeight()
      .background(
        RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
          .fill(Color.bones.grey3)
          .overlay(
            RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
              .stroke(Color.bones.grey6, lineWidth: 1)
          )
      )     
      .foregroundStyle(Color.bones.grey6)
    }
  }
}

/// A preview provider for `BonesMediumButton` and `BonesMediumButtonOutline`.
///
/// This struct provides a variety of button instances to preview
/// different visual states like enabled, disabled, with icons, or with subtitles.
struct Preview_BonesMediumButton: View {
  var body: some View {
    Section {
      // MARK: Fill
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.medium(
          .fill(
            icon: .share
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.medium(
          .fill(
            icon: .add
          )))
        )
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.medium(
          .fill(
            icon: nil
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.medium(
          .fill(
            icon: nil
          )))
        )
        .disabled(true)

      // MARK: Outline
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.medium(
          .outline(
            icon: .add
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.medium(
          .outline(
            icon: .add
          )))
        )
        .disabled(true)

      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.medium(
          .outline(
            icon: nil
          )))
        )
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.medium(
          .outline(
            icon: nil
          )))
        )
        .disabled(true)
    } header: {
      Text("Medium")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesMediumButton()
  }
}
