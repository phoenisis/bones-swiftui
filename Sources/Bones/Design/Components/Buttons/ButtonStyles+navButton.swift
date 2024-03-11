//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 08/11/2023.
//

import SwiftUI

/// A custom button style for a navigation bar using the Bones UI design system.
///
/// This style applies to a button a circular shape with an icon and handles the pressed state animation.
///
/// ```
/// Button(action: {
///     // Action for the button
/// }) {
///     // Label for the button
/// }
/// .buttonStyle(BonesNavbarIconButton(icon: .exampleIcon))
/// ```
///
/// - Author: Quentin PIDOUX
struct BonesNavbarIconButton: ButtonStyle {
  /// Environment property to check if the button is enabled.
  @Environment(\.isEnabled) private var isEnabled

  /// The icon token from BonesIconToken that represents the icon.
  let icon: BonesIconToken
  /// Size of the icon.
  let iconSize: Double = 16
  /// Opacity of the background circle.
  let backgroundOpacity: Double = 0.1
  /// Size of the circular frame.
  let frameSize: Double = 32

  /// Creates the visual representation of a button with `BonesNavbarButton` style.
  ///
  /// - Parameter configuration: The properties of the button, like its label.
  ///
  /// - Returns: A view that represents the body of a button.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      Circle()
        .fill(Color.bones.primary.opacity(backgroundOpacity))
        .frame(width: frameSize, height: frameSize)
        .overlay(alignment: .center, content: {
          BonesIcon(icon: .bones(icon), fontWeight: .black, renderingMode: .template)
            .frame(width: iconSize, height: iconSize)
            .foregroundStyle(Color.bones.primary)
        })
        .overlay(
          Circle()
            .stroke(lineWidth: 2.0)
            .fill(Color.bones.primary)
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
      Circle()
        .fill(Color.bones.grey5.opacity(backgroundOpacity))
        .frame(width: frameSize, height: frameSize)
        .overlay(alignment: .center, content: {
          BonesIcon(icon: .bones(icon), fontWeight: .bold, renderingMode: .template)
            .frame(width: iconSize, height: iconSize)
            .foregroundStyle(Color.bones.grey5)
        })
    }
  }
}


/// A custom button style for a navigation bar using the Bones UI design system.
/// This style applies to a button a circular shape with a text and handles the pressed state animation.
/// ```
/// Button(action: {
///    // Action for the button
/// }) {
///    // Label for the button
/// }
/// .buttonStyle(BonesNavbarButton())
/// ```
///
struct BonesNavbarButton: ButtonStyle {
  /// Environment property to check if the button is enabled.
  @Environment(\.isEnabled) private var isEnabled

  /// The icon token from BonesIconToken that represents the icon.
  let icon: BonesIconToken = .add
  /// Size of the icon.
  let iconSize: Double = 10
  /// Opacity of the background circle.
  let backgroundOpacity: Double = 0.1
  /// Size of the circular frame.
  let frameSize: Double = 24

  /// Creates the visual representation of a button with `BonesNavbarButton` style.
  /// - Parameter configuration: The properties of the button, like its label.
  /// - Returns: A view that represents the body of a button.
  func makeBody(configuration: Configuration) -> some View {
    if isEnabled {
      HStack {
        configuration.label
          .textCase(.uppercase)
          .font(.custom(.bones(.smallBold)))
          .foregroundStyle(Color.bones.primary)
      }
      .padding(.horizontal, .bones(.medium))
      .frame(height: frameSize)
      .background(
        RoundedRectangle(bonesRadius: .bones(.small), style: .continuous)
          .fill(Color.bones.primary.opacity(backgroundOpacity))
      )
      .overlay(
        RoundedRectangle(bonesRadius: .bones(.small), style: .continuous)
          .stroke(lineWidth: 2)
          .fill(Color.bones.primary)
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
      HStack {
        configuration.label
          .textCase(.uppercase)
          .font(.custom(.bones(.smallBold)))
          .foregroundStyle(Color.bones.grey5)
      }
      .padding(.horizontal, .bones(.medium))
      .frame(height: frameSize)
      .background(
        RoundedRectangle(bonesRadius: .bones(.small), style: .continuous)
          .fill(Color.bones.grey5.opacity(backgroundOpacity))
      )
    }
  }
}

// MARK: - Preview

/// A preview structure for `BonesNavbarButton`.
///
/// This preview creates a section with two states of the navbar button:
/// active and disabled.
struct Preview_BonesNavbarButton: View {
  var body: some View {
    Section {
      Button("") {}
        .buttonStyle(.bones(.navBar(.icon(.close))))

      Button("") {}
        .buttonStyle(.bones(.navBar(.icon(.close))))
        .disabled(true)

      Button("esse occaecat") {}
        .buttonStyle(.bones(.navBar(.text)))
      Button("esse occaecat") {}
        .buttonStyle(.bones(.navBar(.text)))
        .disabled(true)
    } header: {
      Text("Navbar button")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesNavbarButton()
  }
}
