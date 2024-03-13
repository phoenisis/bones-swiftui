//
//  TrackerRoundButton.swift
//
//
//  Created by Quentin PIDOUX on 18/10/2023.
//

import SwiftUI

/// `BonesTrackerRoundButton` is a stylized button with various visual configurations.
///
/// This button style includes several preset designs that change
/// the button's appearance based on its functional role, such as play, pause, stop, lock, and switch.
public struct BonesTrackerRoundButton: ButtonStyle {

  /// Enumeration of the various button types supported by `BonesTrackerRoundButton`.
  ///
  /// Each case in this enum corresponds to a particular visual style and icon for the button.
  public enum ButtonType: String, CaseIterable, Identifiable {
    case play
    case pause
    case stop
    case lock
    case `switch`

    public var id: String { rawValue }
  }

  @Environment(\.isEnabled) private var isEnabled

  let buttonType: ButtonType

  var buttonSize: Double {
    get {
      switch buttonType {
        case .play, .pause, .stop:
          64
        case .lock, .switch:
          56
      }
    }
  }

  var IconSize: Double {
    get {
      switch buttonType {
        case .play, .pause, .stop:
          28
        case .lock, .switch:
          16
      }
    }
  }

  var imageRotationDegree: Double {
    get {
      switch buttonType {
        case .play, .pause, .lock, .switch:
          0
        case .stop:
          15
      }
    }
  }

  var backgroundColor: Color {
    get {
      switch buttonType {
        case .play, .lock, .switch:
          Color.bones.white
        case .pause, .stop:
          Color.bones.primary
      }
    }
  }

  var foregroundColor: Color {
    get {
      switch buttonType {
        case .play:
          Color.bones.primary
        case .pause, .stop:
          Color.bones.primaryForeground
        case .lock, .switch:
          Color.bones.textDark
      }
    }
  }

  var strokeColor: Color {
    get {
      switch buttonType {
        case .play:
          Color.bones.primary
        case .pause, .stop, .lock, .switch:
          Color.clear
      }
    }
  }

  func generateImage() -> Image {
    switch buttonType {
      case .play:
        Image(.bones(.play))
      case .pause:
        Image(.bones(.pause))
      case .stop:
        Image(.bones(.finish))
      case .lock:
        Image(.bones(.lock))
      case .switch:
        Image(.bones(.switch))
    }
  }

  /// Constructs the button’s appearance.
  ///
  /// - Parameter configuration: The properties to use when creating the button’s view.
  ///
  /// - Returns: A view that represents the body of the button.
  public func makeBody(configuration: Configuration) -> some View {
    generateImage()
      .renderingMode(.template)
      .resizable()
      .scaledToFit()
      .frame(width: IconSize, height: IconSize)
      .rotationEffect(.degrees(imageRotationDegree))
      .foregroundColor(foregroundColor)
      .frame(width: buttonSize, height: buttonSize)
      .background(
        Circle()
          .fill(backgroundColor)
          .shadow(radius: .bones(configuration.isPressed ? .none : .far))
          .overlay(content: {
            Circle()
              .stroke(strokeColor, lineWidth: 2.0)
          })
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
  }
}

/// A preview struct to visualize the `BonesTrackerRoundButton` in different styles.
struct Preview_BonesTrackerRoundButton: View {
  var body: some View {
    Section {
      LazyVGrid(
        columns: [
          GridItem(.flexible()),
          GridItem(.flexible()),
          GridItem(.flexible())
        ],
        alignment: .center,
        spacing: 16,
        content: {
          ForEach(BonesTrackerRoundButton.ButtonType.allCases) { type in
            Button("") {}
              .buttonStyle(.bones(.tracker(.round(type))))
          }
        }
      )
    } header: {
      Text("Round")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesTrackerRoundButton()
  }
}
