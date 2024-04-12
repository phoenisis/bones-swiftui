//
//  CardButton.swift
//  
//
//  Created by Quentin PIDOUX on 27/03/2024.
//

import SwiftUI

public struct BonesCardButton<Content: View, Footer: View, TopAction: View>: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  @Environment(\.cardLayout) private var cardLayout
  @Environment(\.idealSize) private var idealSize
  @Environment(\.textColor) private var textColor
  @Environment(\.backgroundColor) private var backgroundColor
  
  private let showTitle: Bool
  private let isAvailable: Bool
  private let description: String
  private let showBorder: Bool
  private let titleStyle: Font
  private let descriptionStyle: Font
  private let radius: CGFloat.BonesRadius
  private let shadowStyle: ShadowStyle.BonesShadowToken
  
  @ViewBuilder private let content: Content
  @ViewBuilder private let footer: Footer
  @ViewBuilder private let topAction: TopAction
  
  public init(
    description: String = "",
    showTitle: Bool = false,
    showBorder: Bool = false,
    titleStyle: Font.BonesFontStyle = .bones(.h3),
    descriptionStyle: Font.BonesFontStyle = .bones(.body),
    radius: CGFloat.BonesRadius = .large,
    shadowStyle: ShadowStyle.BonesShadowToken = .close,
    isAvailable: Bool = true,
    @ViewBuilder content: () -> Content,
    @ViewBuilder footer: () -> Footer = { EmptyView() },
    @ViewBuilder topAction: () -> TopAction = { EmptyView() }
  ) {
    self.showTitle = showTitle
    self.description = description
    self.showBorder = showBorder
    self.titleStyle = Font.custom(titleStyle)
    self.descriptionStyle = Font.custom(descriptionStyle)
    self.radius = radius
    self.shadowStyle = shadowStyle
    self.isAvailable = isAvailable
    self.content = content()
    self.footer = footer()
    self.topAction = topAction()
  }
  
  /// Creates the view of the button based on the button's configuration.
  /// - Parameter configuration: The current configuration of the button.
  /// - Returns: A view that represents the body of the button.
  public func makeBody(configuration: Configuration) -> some View {
    VStack(alignment: .leading, spacing: 0) {
      header(configuration)
      
      if isContentEmpty == false {
        VStack(alignment: cardLayout.alignment, spacing: cardLayout.spacing) {
          content
        }
        .padding([.horizontal, .bottom], cardLayout.padding)
        .padding(.top, isHeaderEmpty ? cardLayout.padding : 0)
      }
      
      if isFooterEmpty == false {
        VStack(alignment: cardLayout.alignment, spacing: cardLayout.spacing) {
          footer
        }
        .padding([.horizontal, .bottom], cardLayout.padding)
        .padding(.top, (isContentEmpty && isFooterEmpty) ? cardLayout.padding : 0)
        .accessibilityIdentifier(.cardFooter)
      }
    }
    .frame(maxWidth: idealSize.horizontal == true ? nil : .infinity, alignment: .leading)
    .background(resolvedBackground(configuration))
    .padding(.horizontal, .bones(.small))
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed && (isEnabled && isAvailable)
    )
    .animation(.default, value: configuration.isPressed)
    .changeEffect(
      .feedback(
        hapticImpact: .light
      ),
      value: configuration.isPressed && (isEnabled && isAvailable)
    )
  }
  
  @ViewBuilder private func header(_ configuration: Configuration) -> some View {
    if isHeaderEmpty == false {
      VStack(alignment: .leading, spacing: .bones(.medium)) {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
          configuration.label
            .font(titleStyle)
            .foregroundStyle(textColor)
            .accessibilityIdentifier(.cardTitle)
          
          if idealSize.horizontal != true {
            Spacer(minLength: .BonesSpacing.small.value)
          }
          
          topTrailingAction
        }
        
        if description.isEmpty == false {
          HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text(description)
              .font(descriptionStyle)
              .foregroundStyle(textColor)
              .accessibilityIdentifier(.cardDescription)
          }
        }
      }
      .padding(.bones(.medium))
    }
  }
  
  @ViewBuilder private var topTrailingAction: some View {
    topAction
      .padding(.vertical, -.BonesSpacing.small.value)
      .accessibilityIdentifier(.cardAction)
  }
  
  @ViewBuilder private func resolvedBackground(_ configuration: Configuration) -> some View {
    RoundedRectangle(
      bonesRadius: .bones(radius),
      style: .continuous
    )
    .fill(backgroundColor
      .shadow(.bones
        .drop(
          (isEnabled && isAvailable)
            ? configuration.isPressed ? .reallyClose : shadowStyle
            : .none
        )
      )
    )
    .overlay(content: {
      RoundedRectangle(
        bonesRadius: .bones(radius),
        style: .continuous
      )
      .stroke(lineWidth: showBorder ? 2 : 0)
      .foregroundStyle(Color.bones.primary)
    })
    
    .animation(.default, value: configuration.isPressed)
  }
  
  private var isHeaderEmpty: Bool {
    if topAction.isEmpty, showTitle == false {
      return true
    } else {
      return false
    }
  }
  
  private var isContentEmpty: Bool {
    content is EmptyView
  }
  
  private var isTopActionEmpty: Bool {
    topAction is EmptyView
  }
  
  private var isFooterEmpty: Bool {
    footer is EmptyView
  }
}


// MARK: - Previews
struct ButtonCardPreviews: PreviewProvider {
  
  static var previews: some View {
    PreviewWrapper {
      standalone
        .screenLayout()
      
      content
        .screenLayout()
      
      standaloneIdealSize
        .padding(.bones(.medium))
      
      snapshot
    }
    .background(Color.bones.AQILevel1)
    .previewLayout(.sizeThatFits)
  }
  
  @ViewBuilder static var content: some View {
    cardWithFillLayoutContentNoHeader
    cardWithOnlyCustomContent
    clear
  }
  
  static var standalone: some View {
    ScrollView {
      VStack(spacing: .bones(.medium)) {
        Button("button title") {}
          .buttonStyle(
            BonesCardButton(
              description: "Description",
              showBorder: false,
              radius: .large,
              content: {
                contentPlaceholder
              }
            )
          )
        
        Button("button title") {}
          .buttonStyle(
            BonesCardButton(
              description: "Description",
              showBorder: true,
              radius: .large,
              content: {
                contentPlaceholder
              }
            )
          )
          .disabled(true)
      }
    }
    .previewDisplayName()
  }
  
  static var standaloneIdealSize: some View {
    HStack(spacing: .bones(.large)) {
      BonesCard("Card", description: "Intrinsic") {
        intrinsicContentPlaceholder
      }
      
      Spacer(minLength: 0)
    }
    .idealSize()
    .previewDisplayName()
  }
  
  static var cardWithFillLayoutContentNoHeader: some View {
    BonesCard {
      contentPlaceholder
      contentPlaceholder
    }
    .cardLayout(.fill)
    .previewDisplayName()
  }
  
  static var cardWithOnlyCustomContent: some View {
    BonesCard {
      contentPlaceholder
      contentPlaceholder
    }
    .previewDisplayName()
  }
  
  static var clear: some View {
    BonesCard(
      "Card without borders and background",
      showBorder: false
    ) {
      Text("lorem")
    }
    .cardLayout(.fill)
    .backgroundStyle(.clear)
    .previewDisplayName()
  }
  
  @ViewBuilder static var snapshot: some View {
    VStack(spacing: .bones(.medium)) {
      standalone
      standaloneIdealSize
    }
    .screenLayout()
    .background(Color.bones.background)
  }
}
