//
//  NavigationButton.swift
//
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

/// `BonesNavigationButton`: A custom SwiftUI button style for navigation purposes.
///
/// This button style provides a unique visual and interactive experience for buttons used in a navigation context. It includes custom fonts, padding, opacity changes, and animations. The style changes based on the state of the button, such as whether it's enabled, open, or pressed. It also adjusts its layout based on the `isLeading` property.
///
/// The button style includes a `ZStack` layout with two primary components: the button's label and an icon (represented by `BonesIcon`). The icon's visibility and scale change based on the `isOpen` state. The button's size, background, and shadow are also dynamically adjusted.
///
/// Usage Example:
///
/// ```
/// Button("Navigation") {
///     // Action for the button
/// }
/// .buttonStyle(BonesNavigationButton(isOpen: isOpen, isLeading: isLeading))
/// ```
///
/// - Parameters:
///   - isOpen: A `Bool` value indicating whether the button is in an "open" state. This affects the button's appearance and layout.
///   - isLeading: A `Bool` value that determines whether the button is aligned to the leading edge. This influences the button's horizontal alignment.
///
/// - Note: `BonesIcon`, `.bonesRadius`, `.bones`, `Color.bones`, and `Haptic.feedback` are assumed to be custom implementations specific to your project.
struct BonesNavigationButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  var isOpen: Bool
  var isLeading: Bool

  init(
    isOpen: Bool,
    isLeading: Bool
  ) {
    self.isOpen = isOpen
    self.isLeading = isLeading
  }

  func makeBody(configuration: Configuration) -> some View {
    ZStack(alignment: .center) {
      if isEnabled {
        configuration.label
          .font(.custom(.bones(.bodyBold)))
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
          .padding(.vertical, .bones(.medium))
          .padding(.horizontal, .bones(.large))
          .opacity(isOpen ? 0 : 1)
      } else {
        configuration.label
          .font(.custom(.bones(.bodyBold)))
          .multilineTextAlignment(.center)
          .minimumScaleFactor(0.5)
          .padding(.vertical, .bones(.medium))
          .padding(.horizontal, .bones(.large))
          .opacity(isOpen ? 0 : 1)
      }
      BonesIcon(icon: .bones(.close), fontWeight: .medium, renderingMode: .template)
        .scaledToFit()
        .frame(width: 24, height: 24)
        .opacity(isOpen ? 1 : 0)
        .scaleEffect(isOpen ? 1 : 0.5)
    }
    .frame(
      maxWidth: isOpen ? 48 : .infinity,
      alignment: .center
    )
    .frame(height: 48)
    .background(
      RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        .fill(
          isEnabled
            ? Color.bones.primary.shadow(.bones.drop(.far))
            : Color.bones.grey3.shadow(.bones.drop(.none))
        )
    )
    .foregroundStyle(isEnabled ? Color.bones.primaryForeground : Color.bones.grey6)
    .frame(maxWidth: .infinity, alignment: isLeading ? .leading : .trailing)
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed
    )
    .animation(.default, value: configuration.isPressed)
    .animation(.snappy(duration: 0.1), value: isOpen)
    .changeEffect(
      .feedback(
        hapticImpact: .light
      ),
      value: configuration.isPressed
    )
  }
}

/// `ButtonBonesNavigationDropdown`: A custom SwiftUI view that creates a dropdown navigation menu using a floating button.
///
/// This view is initialized with a title, a Boolean indicating the alignment, and an array of menu button items. Each menu button is represented by a tuple consisting of a `String` (the button's title) and a closure (`() -> Void`) that defines the action to be executed when the button is tapped.
///
/// The view uses a `FloatingButton` component, which may be a custom component in your project, to render the dropdown menu. The `FloatingButton` is configured with the provided title, an array of buttons (converted from `menuButtons`), and the alignment preference.
///
/// Usage:
///
/// ```
/// ButtonBonesNavigationDropdown("Menu", isLeading: true, menuButtons: [
///     ("Option 1", { print("Option 1 selected") }),
///     ("Option 2", { print("Option 2 selected") })
/// ])
/// ```
///
/// - Parameters:
///   - title: A `String` representing the title of the main floating button.
///   - isLeading: A `Bool` value that determines whether the floating button is aligned to the leading edge. Defaults to `false`.
///   - menuButtons: An array of tuples. Each tuple consists of a `String` (button title) and a closure (`() -> Void`) representing the button's action.
public struct ButtonBonesNavigationDropdown: View {
  @State var show = false
  var isLeading: Bool
  let title: LocalizedStringKey
  var menuButtons: [(LocalizedStringKey, () -> Void)]

  public init(_ title: LocalizedStringKey, isLeading: Bool = false, menuButtons: [(LocalizedStringKey, () -> Void)]) {
    self.isLeading = isLeading
    self.title = title
    self.menuButtons = menuButtons
  }

  public var body: some View {
    FloatingButton(
      title,
      buttons: menuButtons.map { .init(title: $0.0,action: $0.1) },
      isMainButtonLeading: isLeading
    )
  }
}

// MARK: - Preview
struct Preview_BonesNavigationButton: View {
  @State var show = false
  var body: some View {
    List {
      Section {

      } header: {
        Text("Navigation")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }
    }
    .overlay(alignment: .bottom) {

      HStack(alignment: .center, spacing: .bones(.large), content: {
        Button("title") {}
          .buttonStyle(.bones(.navigation))

        ButtonBonesNavigationDropdown(
          "title",
          menuButtons: [
            ("button 1", { print("button 1 tapped") }),
            ("button 2", { print("button 2 tapped") }),
            ("button 3", { print("button 3 tapped") }),
          ]
        )

      })
      .padding(.bones(.xLarge))
    }
  }
}

#Preview {
  Preview_BonesNavigationButton()
}

