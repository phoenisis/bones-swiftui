//
//  DefaultTextFieldStyle.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

public struct BonesDefaultTextFieldStyle: TextFieldStyle {
  public func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .font(.bones(.bodyBold))
      .foregroundStyle(Color.bones.textDark)
      .frame(minHeight: 40)
      .padding(.horizontal, .bones(.large))
      .padding(.vertical, .bones(.medium))
      .background(
        RoundedRectangle(
          bonesRadius: .bones(.medium),
          style: .continuous
        )
        .overlay {
          RoundedRectangle(
            bonesRadius: .bones(.medium),
            style: .continuous
          )
          .stroke(Color.bones.grey2, lineWidth: 2)
        }
        .foregroundStyle(
          Color.bones.white
            .shadow(.bones.inner(.close))
        )
      )
  }
}
