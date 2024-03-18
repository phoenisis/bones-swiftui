//
//  BonesCard.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

/// A customizable card view component for SwiftUI applications.
public struct BonesCard<Content: View, Footer: View, TopAction: View>: View {
  @Environment(\.cardLayout) private var cardLayout
  @Environment(\.idealSize) private var idealSize
  @Environment(\.textColor) private var textColor
  @Environment(\.backgroundColor) private var backgroundColor
  
  private let title: String
  private let description: String
  private let showBorder: Bool
  private let titleStyle: Font
  private let radius: CGFloat.BonesRadius
  private let shadowStyle: ShadowStyle.BonesShadowToken
  @ViewBuilder private let content: Content
  @ViewBuilder private let footer: Footer
  @ViewBuilder private let topAction: TopAction
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      header
      
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
    .background(resolvedBackground)
    .padding(.horizontal, .bones(.small))
  }
  
  @ViewBuilder private var header: some View {
    if isHeaderEmpty == false {
      VStack(alignment: .leading, spacing: .bones(.medium)) {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
          Text(title)
            .font(.custom(.bones(.h3)))
            .foregroundStyle(textColor)
            .accessibilityIdentifier(.cardTitle)
          
          if title.isEmpty == false {
            if idealSize.horizontal != true {
              Spacer(minLength: .BonesSpacing.small.value)
            }
            
            topTrailingAction
          }
        }
        
        HStack(alignment: .firstTextBaseline, spacing: 0) {
          Text(description)
            .foregroundStyle(textColor)
            .accessibilityIdentifier(.cardDescription)
          
          if title.isEmpty {
            if idealSize.horizontal != true {
              Spacer(minLength: .BonesSpacing.small.value)
            }
            
            topTrailingAction
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
  
  @ViewBuilder private var resolvedBackground: some View {
    RoundedRectangle(bonesRadius: .bones(radius), style: .continuous)
      .fill(backgroundColor)
      .shadow(radius: .bones(shadowStyle))
  }
  
  private var isHeaderEmpty: Bool {
    if topAction.isEmpty, title.isEmpty, description.isEmpty {
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

// MARK: - Inits
public extension BonesCard {
  
  /// Creates Bones ``Card`` component.
  init(
    _ title: String = "",
    description: String = "",
    showBorder: Bool = true,
    radius: CGFloat.BonesRadius = .medium,
    shadowStyle: ShadowStyle.BonesShadowToken = .close,
    titleStyle: Font = .custom(.bones(.h3)),
    @ViewBuilder content: () -> Content,
    @ViewBuilder footer: () -> Footer = { EmptyView() },
    @ViewBuilder topAction: () -> TopAction = { EmptyView() }
  ) {
    self.title = title
    self.description = description
    self.showBorder = showBorder
    self.radius = radius
    self.shadowStyle = shadowStyle
    self.titleStyle = titleStyle
    self.content = content()
    self.footer = footer()
    self.topAction = topAction()
  }
}

// MARK: - Identifiers
public extension AccessibilityID {
  static let cardTitle = Self(rawValue: "Bones.card.title")
  static let cardDescription = Self(rawValue: "Bones.card.description")
  static let cardFooter = Self(rawValue: "Bones.card.footer")
  static let cardAction = Self(rawValue: "Bones.card.action")
}

// MARK: - Types
/// The layout of Bones ``BonesCard`` stack content.
public struct CardLayout {
  
  /// Content layout uses a `VStack` with default `.medium` padding and spacing.
  public static let `default` = Self()
  
  /// Content layout uses a `VStack` with no padding and spacing to fill the content to `Card` edges.
  public static let fill = Self(alignment: .leading, padding: 0, spacing: 0)
  
  var alignment: HorizontalAlignment = .leading
  var padding: CGFloat = .BonesSpacing.medium.value
  var spacing: CGFloat = .BonesSpacing.medium.value
}

// MARK: - Previews
struct CardPreviews: PreviewProvider {

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
        BonesCard("Card", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam interdum egestas iaculis. Ut luctus tincidunt tempor. Phasellus posuere felis laoreet ex molestie rutrum. Ut lacinia et velit at mattis. Ut commodo urna vitae sagittis posuere. Maecenas ligula odio.", radius: .none) {
          contentPlaceholder
          contentPlaceholder
        } footer: {
          footerPlaceholder
        } topAction: {
          Button("Button") {}
            .buttonStyle(.bones(.small(.fill)))
        }
        .cardLayout(.default)
        
        BonesCard("Lorem ipsum dolor sit amet, consectetur", description: "TilePreviews.descriptionMultiline") {
          contentPlaceholder
          contentPlaceholder
        } topAction: {
          Button("Button") {}
            .buttonStyle(.bones(.small(.fill)))
        }
        
        BonesCard("Card with filling layout", description: "TilePreviews.descriptionMultiline") {
          contentPlaceholder
          contentPlaceholder
        } topAction: {
          Button("Button") {}
            .buttonStyle(.bones(.medium(.fill(icon: nil))))
        }
        .cardLayout(.fill)
        
        BonesCard("Card with no content", description: "TilePreviews.descriptionMultiline") {
          EmptyView()
        } topAction: {
          Button("Edit") {}
            .buttonStyle(.bones(.medium(.fill(icon: nil))))
        }
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
    .padding(.vertical, -.BonesSpacing.medium.value)
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

