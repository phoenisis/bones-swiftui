//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 17/11/2023.
//

import SwiftUI

public struct BonesRectangleButton: ButtonStyle {
  var radius: BonesRadiusToken
  var fillColor: BonesColorToken
  var shadow: ShadowToken

  public init(radius: BonesRadiusToken, fillColor: BonesColorToken, shadow: ShadowToken) {
    self.radius = radius
    self.fillColor = fillColor
    self.shadow = shadow
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background {
        RoundedRectangle(bonesRadius: .bones(radius), style: .continuous)
          .fill(Color(.bones(fillColor)))
          .shadow(radius:
                    configuration.isPressed ? .bones(.none) : .bones(shadow))
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
