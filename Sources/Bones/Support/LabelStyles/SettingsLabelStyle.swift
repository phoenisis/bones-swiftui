//
//  SettingsLabelStyle.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

public struct BonesSettingsLabelStyle<Content: View>: LabelStyle {
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
      
      if let trailingIcon {
        BonesIcon(icon: .bones(trailingIcon), renderingMode: .template)
          .foregroundStyle(Color.bones.grey4)
          .frame(width: 16, height: 16)
      }
    }
    .listRowBackground(Color.bones.white)
  }
}

extension BonesSettingsLabelStyle where Content == EmptyView {
  public init(_ style: Style,
              trailingIcon: Image.BonesImage? = nil) {
    self.init(style, trailingIcon: trailingIcon, trailingContent: { EmptyView() })
  }
}
