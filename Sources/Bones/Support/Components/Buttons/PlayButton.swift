//
//  PlayButton.swift
//
//
//  Created by Quentin PIDOUX on 29/09/2023.
//

import SwiftUI

/// A custom button style for the home play button in the Bones design system.
struct BonesPlayButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  /// Creates the view of the button based on the button's configuration.
  /// - Parameter configuration: The current configuration of the button.
  /// - Returns: A view that represents the body of the button.
  func makeBody(configuration: Configuration) -> some View {
    ZStack(alignment: .center) {
      Circle()
        .fill(
          Color.bones.primary
            .shadow(.bones.drop(configuration.isPressed
                ? .reallyClose
                : .close)
            )
        )
        .frame(width: 64, height: 64)

      Circle()
        .fill(
          Color.bones.primary
            .shadow(.bones.drop(configuration.isPressed
                ? .close
                : .far)
            )
        )
        .frame(width: 56, height: 56)

      VStack(
        alignment: .center,
        spacing: .bones(.small)
      ) {
        Image(.bones(.play))
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
        configuration.label
          .font(.bones(.smallBold))
          .minimumScaleFactor(0.5)
      }
      .foregroundColor(Color.bones.primaryForeground)
      .frame(width: 34, height: 34)
    }
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed
    )
    .animation(.default, value: configuration.isPressed)
    .changeEffect(
      .feedback(
        hapticImpact: .medium
      ),
      value: configuration.isPressed
    )
  }
}

/// A preview struct to visualize the `BonesHomePlay` button style in different states.
struct Preview_BonesButtonPlay: View {
  var body: some View {
    Section {
      Button("Bouger") {}
        .buttonStyle(.bones(.homePlay))
    } header: {
      Text("Home Play")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesButtonPlay()
  }
}
