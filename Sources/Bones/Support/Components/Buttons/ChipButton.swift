//
//  ChipButton.swift
//
//
//  Created by Quentin PIDOUX on 09/10/2023.
//

import SwiftUI

/// `BonesChipButton`
/// A custom button style that applies aesthetic and interactive design to the buttons.
///
/// This style is conditional based on whether the button is selected or not and provides different visuals accordingly.
struct BonesChipButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  /// Indicates whether the button is in a selected state.
  let selected: Bool

  /// Makes and returns the body of the button with applied custom styles.
  ///
  /// - Parameter configuration: The properties to use when rendering the button.
  /// - Returns: A view that represents the body of the button.
  func makeBody(configuration: Configuration) -> some View {
    if selected {

      configuration.label
        .textCase(.uppercase)
        .font(.bones(.body))
        .minimumScaleFactor(0.5)
        .padding(.horizontal, .bones(.large))
        .padding(.vertical, .bones(.medium))
        .foregroundStyle(
          configuration.isPressed
            ? Color.bones.textDark
            : Color.bones.primaryForeground
        )
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(configuration.isPressed
              ? Color.bones.white
              : Color.bones.primary)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.primary, lineWidth: 1)
            )
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
        .font(.bones(.body))
        .minimumScaleFactor(0.5)
        .padding(.horizontal, .bones(.large))
        .padding(.vertical, .bones(.medium))
        .foregroundStyle(
          configuration.isPressed
            ? Color.bones.primaryForeground
            : Color.bones.textDark
        )
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(configuration.isPressed
              ? Color.bones.primary
              : Color.bones.white)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.primary, lineWidth: 1)
            )
        )
        .animation(.default, value: configuration.isPressed)
        .changeEffect(
          .feedback(
            hapticImpact: .light
          ),
          value: configuration.isPressed
        )
    }
  }
}

fileprivate extension View {
  /// Applies an inner shadow to a view using a specific shape.
  ///
  /// - Parameters:
  ///   - shape: The shape used to apply the inner shadow.
  ///   - angle: The angle of the shadow.
  ///   - color: The color of the shadow.
  ///   - width: The width of the shadow.
  ///   - blur: The blur radius of the shadow.
  /// - Returns: A view that includes an inner shadow.
  func innerShadow(using shape: some Shape, angle: Angle = .degrees(0), color: Color = .bones.black, width: CGFloat = 6, blur: CGFloat = 6) -> some View {
    let finalX = CGFloat(cos(angle.radians - .pi / 2))
    let finalY = CGFloat(sin(angle.radians - .pi / 2))
    return self
      .overlay( shape
        .stroke(color, lineWidth: width)
        .offset(x: finalX * width * 0.6, y: finalY * width * 0.6)
        .blur(radius: blur)
        .mask(shape)
      )
  }
}

/// `Preview_BonesChipButton`
/// A preview provider that helps visualize the appearance of `BonesChipButton` within the canvas during design time.
struct Preview_BonesChipButton: View {
  var body: some View {
    Section {
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.chip(selected: false)))

      Button("Laborum aliquip velit consequat ex tempor enim amet elit reprehenderit pariatur voluptate.") {}
        .buttonStyle(.bones(.chip(selected: true)))

    } header: {
      Text("Chip")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesChipButton()
  }
}
