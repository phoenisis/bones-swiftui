//
//  Buttons+Interface.swift
//  
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

/// An extension that provides a variety of button styles to SwiftUI views.
extension View {

  /// Applies a specific button style to a view.
  ///
  /// This function takes a predefined button style and applies it to the view.
  /// - Parameter bonesStyle: An enum case representing a specific button style.
  /// - Returns: A view with a specific button style applied.
  public func buttonStyle(_ bonesStyle: BonesButtonStyles) -> some View where Self == Button<Text> {
    switch bonesStyle {
      case .bones(let style):
        switch style {
          case let .text(icon):
            return AnyView(self.buttonStyle(BonesTextButton(icon: icon)))
          case .homePlay:
            return AnyView(self.buttonStyle(BonesHomePlay()))
          case let .select(variant):
            switch variant {
              case .fill:
                return AnyView(self.buttonStyle(BonesSmallMenuButtonFill()))
              case .outline:
                return AnyView(self.buttonStyle(BonesSmallMenuButtonOutline()))
            }
          case let .small(variant):
            switch variant {
              case .fill:
                return AnyView(self.buttonStyle(BonesSmallButton()))
              case .outline:
                return AnyView(self.buttonStyle(BonesSmallButtonOutline()))
            }
          case let .medium(variant):
            switch variant {
              case let .fill(icon):
                return AnyView(self.buttonStyle(BonesMediumButton(icon: icon)))
              case let .outline(icon):
                return AnyView(self.buttonStyle(BonesMediumButtonOutline(icon: icon)))
            }
          case let .large(variant):
            switch variant {
              case let .fill(icon, subtitle):
                return AnyView(self.buttonStyle(BonesLargeButton(icon: icon, subtitle: subtitle)))
              case let .outline(icon, subtitle):
                return AnyView(self.buttonStyle(BonesLargeButtonOutline(icon: icon, subtitle: subtitle)))
            }
          case let .chip(selected):
            return AnyView(self.buttonStyle(BonesChipButton(selected: selected ?? false)))
          case let .tracker(variant):
            switch variant {
              case .round(let type):
                return AnyView(self.buttonStyle(BonesTrackerRoundButton(buttonType: type)))
            }

          case let .card(variant):
            switch variant {
              case .mobility(let imageUrl):
                return AnyView(self.buttonStyle(BonesCardMobilityButton(imageUrl: imageUrl)))
            }

          case let .navBar(variant):
            switch variant {
              case .icon(let icon):
                return AnyView(self.buttonStyle(BonesNavbarIconButton(icon: icon)))
              case .text:
                return AnyView(self.buttonStyle(BonesNavbarButton()))
            }

          case let .shape(variant):
            switch variant {
              case .rectangle(let radius, let fillColor, let shadow):
                return AnyView(self.buttonStyle(BonesRectangleButton(radius: radius, fillColor: fillColor, shadow: shadow)))
            }

          case .navigation:
            return AnyView(self.buttonStyle(BonesNavigationButton(isOpen: false, isLeading: false)))

          case .quiz(style: let style, isSelected: let isSelected, imageUrl: let imageUrl):
            return AnyView(self.buttonStyle(QuizButton(style: style, isSelected: isSelected, imageUrl: imageUrl)))

          case let .socialTag(availability, remaining, image, description, date, points):
            return AnyView(self.buttonStyle(BonesSocialTagSelectionButton(availability: availability, remaining: remaining, image: image, description: description, date: date, points: points)))


          case let .boost(startAt, endAt):
            return AnyView(self.buttonStyle(BonesBoostButton(startDate: startAt, endDate: endAt)))
        }
    }
  }

  public func buttonStyle<S>(_ bonesStyle: BonesButtonStyles) -> some View where S : PrimitiveButtonStyle {
    switch bonesStyle {
      case .bones(let style):
        switch style {
          case let .text(icon):
            return AnyView(self.buttonStyle(BonesTextButton(icon: icon)))
          case .homePlay:
            return AnyView(self.buttonStyle(BonesHomePlay()))
          case let .select(variant):
            switch variant {
              case .fill:
                return AnyView(self.buttonStyle(BonesSmallMenuButtonFill()))
              case .outline:
                return AnyView(self.buttonStyle(BonesSmallMenuButtonOutline()))
            }
          case let .small(variant):
            switch variant {
              case .fill:
                return AnyView(self.buttonStyle(BonesSmallButton()))
              case .outline:
                return AnyView(self.buttonStyle(BonesSmallButtonOutline()))
            }
          case let .medium(variant):
            switch variant {
              case let .fill(icon):
                return AnyView(self.buttonStyle(BonesMediumButton(icon: icon)))
              case let .outline(icon):
                return AnyView(self.buttonStyle(BonesMediumButtonOutline(icon: icon)))
            }
          case let .large(variant):
            switch variant {
              case let .fill(icon, subtitle):
                return AnyView(self.buttonStyle(BonesLargeButton(icon: icon, subtitle: subtitle)))
              case let .outline(icon, subtitle):
                return AnyView(self.buttonStyle(BonesLargeButtonOutline(icon: icon, subtitle: subtitle)))
            }
          case let .chip(selected):
            return AnyView(self.buttonStyle(BonesChipButton(selected: selected ?? false)))
          case let .tracker(variant):
            switch variant {
              case .round(let type):
                return AnyView(self.buttonStyle(BonesTrackerRoundButton(buttonType: type)))
            }

          case let .card(variant):
            switch variant {
              case .mobility(let imageUrl):
                return AnyView(self.buttonStyle(BonesCardMobilityButton(imageUrl: imageUrl)))
            }

          case let .navBar(variant):
            switch variant {
              case .icon(let icon):
                return AnyView(self.buttonStyle(BonesNavbarIconButton(icon: icon)))
              case .text:
                return AnyView(self.buttonStyle(BonesNavbarButton()))
            }

          case let .shape(variant):
            switch variant {
              case .rectangle(let radius, let fillColor, let shadow):
                return AnyView(self.buttonStyle(BonesRectangleButton(radius: radius, fillColor: fillColor, shadow: shadow)))
            }

          case .navigation:
            return AnyView(self.buttonStyle(BonesNavigationButton(isOpen: false, isLeading: false)))

          case let .quiz(style, isSelected, imageUrl):
            return AnyView(self.buttonStyle(QuizButton(style: style, isSelected: isSelected, imageUrl: imageUrl)))

          case let .socialTag(availability, remaining, image, description, date, points):
            return AnyView(self.buttonStyle(BonesSocialTagSelectionButton(availability: availability, remaining: remaining, image: image, description: description, date: date, points: points)))

          case let .boost(startAt, endAt):
            return AnyView(self.buttonStyle(BonesBoostButton(startDate: startAt, endDate: endAt)))
        }
    }
  }
}

/// `BonesButtonStyles` is an enumeration representing various styles that can be applied to buttons.
public enum BonesButtonStyles { case bones(BonesButtonStyleToken) }

/// `BonesButtonStyleToken` is an enumeration of specific button styles.
///
/// This includes styles such as text buttons, home play buttons, small buttons,
/// medium buttons, large buttons, and chip buttons.
public enum BonesButtonStyleToken {
  public enum BonesTracker {
    case round(_ type: BonesTrackerRoundButton.ButtonType)
  }

  public enum BonesCardToken {
    case mobility(_ imageUrl: String?)
  }

  public enum BonesNavBarStyleToken {
    case icon(_ icon: Image.BonesImage)
    case text
  }

  public enum BonesButtonShapeToken {
    case rectangle(CGFloat.BonesRadius, fillColor: Color.BonesColorToken, shadow: ShadowStyle.BonesShadowToken)
  }

  case text(icon: Image.BonesImage?)
  case homePlay
  case small(_ variant: SmallToken)
  case select(_ variant: SmallToken)
  case medium(_ variant: MediumToken)
  case large(_ variant: LargeToken)
  case chip(selected: Bool?)
  case boost(startAt: Date?, endAt: Date?)

  case tracker(_ variant: BonesTracker)
  case card(_ variant: BonesCardToken)

  case navBar(_ variant: BonesNavBarStyleToken)

  case navigation

  case quiz(style: QuizButton.ButtonStyle, isSelected: Bool, imageUrl: String?)

  case shape(_ variant: BonesButtonShapeToken)

  case socialTag(availability: String?, remaining: String?, image: String?, description: String?, date: Date?, points: String?)

  public enum SmallToken {
    case fill
    case outline
  }

  public enum MediumToken {
    case fill(icon: Image.BonesImage?)
    case outline(icon: Image.BonesImage?)
  }

  public enum LargeToken {
    case fill(icon: Image.BonesImage?, subtitle: String?)
    case outline(icon: Image.BonesImage?, subtitle: String?)
  }
}
