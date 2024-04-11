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
  
  private let description: String
  private let showBorder: Bool
  private let titleStyle: Font
  private let radius: CGFloat.BonesRadius
  
  @ViewBuilder private let content: Content
  @ViewBuilder private let footer: Footer
  @ViewBuilder private let topAction: TopAction
  
  public init(
    description: String,
    showBorder: Bool,
    titleStyle: Font = .custom(.bones(.h3)),
    radius: CGFloat.BonesRadius,
    @ViewBuilder content: () -> Content,
    @ViewBuilder footer: () -> Footer = { EmptyView() },
    @ViewBuilder topAction: () -> TopAction = { EmptyView() }
  ) {
    self.description = description
    self.showBorder = showBorder
    self.titleStyle = titleStyle
    self.radius = radius
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
          Separator(color: .bones.grey4)
          footer
        }
        .padding([.horizontal, .bottom], cardLayout.padding)
        .padding(.top, isContentEmpty ? cardLayout.padding : 0)
        .accessibilityIdentifier(.cardFooter)
      }
    }
    .frame(maxWidth: idealSize.horizontal == true ? nil : .infinity, alignment: .leading)
    .background(resolvedBackground(configuration))
    .padding(.horizontal, .bones(.small))
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed && isEnabled
    )
    .animation(.default, value: configuration.isPressed)
    .changeEffect(
      .feedback(
        hapticImpact: .light
      ),
      value: configuration.isPressed && isEnabled
    )
  }
  
  @ViewBuilder private func header(_ configuration: Configuration) -> some View {
    if isHeaderEmpty == false {
      VStack(alignment: .leading, spacing: .bones(.medium)) {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
          configuration.label
            .font(.custom(.bones(.h3)))
            .foregroundStyle(textColor)
            .accessibilityIdentifier(.cardTitle)
          
          if idealSize.horizontal != true {
            Spacer(minLength: .BonesSpacing.small.value)
          }
          
          topTrailingAction
        }
        
        HStack(alignment: .firstTextBaseline, spacing: 0) {
          Text(description)
            .foregroundStyle(textColor)
            .accessibilityIdentifier(.cardDescription)
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
          isEnabled
            ? configuration.isPressed ? .close : .far
            : .none
        )
      )
    )
    
    .animation(.default, value: configuration.isPressed)
  }
  
  private var isHeaderEmpty: Bool {
    if topAction.isEmpty, description.isEmpty {
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
              showBorder: true,
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
