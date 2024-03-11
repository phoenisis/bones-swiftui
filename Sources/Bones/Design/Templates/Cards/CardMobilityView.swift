//
//  SwiftUIView.swift
//
//
//  Created by Quentin PIDOUX on 25/10/2023.
//

import SwiftUI

/// A `ButtonStyle` that styles a button with a particular visual design for a card mobility button.
struct BonesCardMobilityButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let chevronSize: CGFloat = 24

  /// An optional icon that appears next to the button’s text.
  let imageUrl: String?

  /// Creates the view of the button based on the button's configuration.
  ///
  /// - Parameter configuration: The current configuration of the button.
  /// - Returns: A view that represents the body of the button, styled with shadows, icons, and other visual elements.
  func makeBody(configuration: Configuration) -> some View {
    VStack(alignment: .center,
           spacing: nil,
           content: {
      Rectangle()
        .foregroundStyle(
          Color.clear
            .shadow(.bones.drop(.far))
        )
        .aspectRatio(2.9, contentMode: .fit)
    })
    .overlay(alignment: .center, content: {
      configuration.label
        .font(.custom(.bones(.h3)))
        .multilineTextAlignment(.center)
        .minimumScaleFactor(0.9)
        .conditionalEffect(
          .pushDown,
          condition: configuration.isPressed
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding(.vertical, .bones(.large))
        .padding(.horizontal, .bones(.xLarge))
        .overlay(alignment: .trailing, content: {
          BonesIcon(icon: .bones(.chevronRight), fontWeight: .light)
            .frame(width: chevronSize,
                   height: chevronSize,
                   alignment: .center)
            .conditionalEffect(
              .pushDown,
              condition: configuration.isPressed
            )
            .padding(.bones(configuration.isPressed ? .medium : .large))
        })
        .foregroundStyle(
          Color.bones.textLight
            .shadow(.bones.drop(.close))
        )
        .background(
          ZStack(content: {
            if let imageUrl {
              CachedAsyncImage(
                url: URL(string: imageUrl)
              ) {
                image in image.resizable()
              } placeholder: {
                ZStack(alignment: .center) {
                  ProgressView()
                }
              }
            } else {
              Color.bones.black
            }
            Color.bones.black.opacity(0.1)
          })
          .frame(maxWidth: .infinity)
          .aspectRatio(2.9, contentMode: .fill)
          .cornerRadius(.bones(.medium))
        )
    })
    .shadow(radius: .bones(configuration.isPressed ? .none : .close))
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

/// A view that previews different styles of `BonesCardMobilityButton`.
struct Preview_CardMobility: View {
  var body: some View {
    Section {
      Button("ad commodo") {}
        .buttonStyle(.bones(.card(.mobility(nil))))

      Button("nulla ea") {}
        .buttonStyle(.bones(.card(.mobility("https://picsum.photos/300"))))

      Button("eiusmod incididunt aliqua pariatur laborum enim proident dolore") {}
        .buttonStyle(.bones(.card(.mobility("https://picsum.photos/400"))))

      Button("enim culpa consectetur fugiat quis veniam et aute fugiat nostrud exercitation tempor ad et commodo adipisicing commodo pariatur ex laboris") {}
        .buttonStyle(.bones(.card(.mobility("https://picsum.photos/500"))))
    } header: {
      Text("Cards mobility")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview(body: {
  List {
    Preview_CardMobility()
  }
})
