//
//  RectangleButton.swift
//  
//
//  Created by Quentin PIDOUX on 17/11/2023.
//

import SwiftUI

public struct BonesRectangleButton: ButtonStyle {
  var radius: CGFloat.BonesRadius
  var fillColor: Color.BonesColorToken
  var shadow: ShadowStyle.BonesShadowToken

  public init(radius: CGFloat.BonesRadius, fillColor: Color.BonesColorToken, shadow: ShadowStyle.BonesShadowToken) {
    self.radius = radius
    self.fillColor = fillColor
    self.shadow = shadow
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background {
        RoundedRectangle(bonesRadius: .bones(radius), style: .continuous)
          .fill(
            Color(.bones(fillColor))
              .shadow(.bones.drop(configuration.isPressed ? shadow.lowerShadow : shadow))
          )
      }
      .conditionalEffect(
        .pushDown,
        condition: configuration.isPressed
      )
      .animation(.default, value: configuration.isPressed)
      .minimumScaleFactor(0.5)
      .padding(.horizontal, 4)
      .padding(.bottom, 8)
      .changeEffect(
        .feedback(
          hapticImpact: .medium
        ),
        value: configuration.isPressed
      )
  }
}
