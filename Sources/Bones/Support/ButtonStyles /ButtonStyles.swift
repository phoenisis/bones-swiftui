//
//  ButtonStyles.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
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
          case let .defaultText(line):
            return AnyView(self.buttonStyle(BonesDefaultTextButton(lineNumber: line)))
          case let .text(icon):
            return AnyView(self.buttonStyle(BonesTextButton(icon: icon)))
          case .homePlay:
            return AnyView(self.buttonStyle(BonesPlayButton()))
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
            return AnyView(self.buttonStyle(BonesQuizButtonStyle(style: style, isSelected: isSelected, imageUrl: imageUrl)))
            
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
          case let .defaultText(line):
            return AnyView(self.buttonStyle(BonesDefaultTextButton(lineNumber: line)))
          case let .text(icon):
            return AnyView(self.buttonStyle(BonesTextButton(icon: icon)))
          case .homePlay:
            return AnyView(self.buttonStyle(BonesPlayButton()))
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
            return AnyView(self.buttonStyle(BonesQuizButtonStyle(style: style, isSelected: isSelected, imageUrl: imageUrl)))
            
          case let .socialTag(availability, remaining, image, description, date, points):
            return AnyView(self.buttonStyle(BonesSocialTagSelectionButton(availability: availability, remaining: remaining, image: image, description: description, date: date, points: points)))
            
          case let .boost(startAt, endAt):
            return AnyView(self.buttonStyle(BonesBoostButton(startDate: startAt, endDate: endAt)))
        }
    }
  }
}
