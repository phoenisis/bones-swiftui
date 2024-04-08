//
//  NavbarIconButton.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
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
  let icon: Image.BonesImage
  /// Size of the icon.
  let iconSize: Double = 16
  /// Size of the icon pressed.
  var iconSizePressed: Double { get {iconSize/1.15} }
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
          BonesIcon(icon: .bones(icon), fontWeight: .bold, renderingMode: .template)
            .frame(
              width: configuration.isPressed ? iconSizePressed : iconSize,
              height: configuration.isPressed ? iconSizePressed : iconSize
            )
            .foregroundStyle(configuration.isPressed ? Color.bones.primaryForeground : Color.bones.primary)
            .animation(.default, value: configuration.isPressed)
        })
        .background(
          Circle()
            .fill(
              .ultraThinMaterial
                .shadow(.bones.drop(configuration.isPressed ? .none : .reallyClose))
            )
            .overlay(content: {
              configuration.isPressed
              ? AnyView(
                Circle()
                  .fill(
                    Color.bones.primary.opacity(0.5)
                  )
              )
              : AnyView(Color.clear)
             })
          
          
        )
        .animation(.default, value: configuration.isPressed)
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
