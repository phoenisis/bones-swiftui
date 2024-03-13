//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 07/12/2023.
//

import SwiftUI

public struct BonesSettingsIconLabelStyle<Content: View>: LabelStyle {
  public enum Style {
    case primary
    case secondary
    case danger
    case custom(background: Color, foreground: Color)
  }

  var background: Color
  var foreground: Color
  var trailingIcon: Image.BonesImage?
  var trailingContent: () -> Content

  public init(_ style: Style, 
              trailingIcon: Image.BonesImage? = nil,
              @ViewBuilder trailingContent: @escaping () -> Content ) {
    switch style {
      case .primary:
        self.background = .bones.primary
        self.foreground = .bones.primaryForeground

      case .secondary:
        self.background = .bones.secondary
        self.foreground = .bones.secondaryForeground

      case .danger:
        self.background = .bones.alert
        self.foreground = .bones.alertForeground

      case let .custom(background, foreground):
        self.background = background
        self.foreground = foreground
    }
    self.trailingIcon = trailingIcon
    self.trailingContent = trailingContent
  }

  public func makeBody(configuration: Configuration) -> some View {
    HStack(
      alignment: .center,
      spacing: .bones(.large)
    ) {
      configuration.icon
        .scaledToFit()
        .foregroundColor(foreground)
        .background(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
          .frame(width: 32, height: 32)
          .foregroundColor(background))
        .frame(width: 32, height: 32)
        .font(.custom(.bones(.body)))
      configuration.title
        .font(.body)
        .foregroundStyle(Color.bones.textDark)
        .frame(maxWidth: .infinity, alignment: .leading)

      trailingContent()

      if let trailingIcon = trailingIcon {
        BonesIcon(icon: .bones(trailingIcon), renderingMode: .template)
          .foregroundStyle(Color.bones.grey4)
          .frame(width: 16, height: 16)
      }
    }
    .listRowBackground(Color.bones.white)
  }
}

extension BonesSettingsIconLabelStyle where Content == EmptyView {
  public init(_ style: Style,
              trailingIcon: Image.BonesImage? = nil) {
    self.init(style, trailingIcon: trailingIcon, trailingContent: { EmptyView() })
  }
}

#Preview {
  List {
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsIconLabelStyle(.primary))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsIconLabelStyle(.secondary))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsIconLabelStyle(.danger))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsIconLabelStyle(.custom(background: .bones.primary, foreground: .bones.primaryForeground)))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsIconLabelStyle(.primary, trailingIcon: .arrowRight))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsIconLabelStyle(.primary, trailingContent: {
        Text("Hello")
      }))
  }
}
