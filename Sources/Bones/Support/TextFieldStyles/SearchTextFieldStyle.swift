//
//  SearchTextFieldStyle.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

public struct BonesSearchTextFieldStyle: TextFieldStyle {
  /// Stylizes the body of the text field with a search icon.
  public func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .font(.bones(.bodyBold))
      .foregroundStyle(Color.bones.textDark)
      .padding(.leading, .bones(.large))
      .padding(.horizontal, .bones(.medium))
      .padding(.vertical, .bones(.medium))
      .frame(minHeight: 40)
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
      .overlay(
        alignment: .leading,
        content: {
          Image(.bones(.search))
            .font(.bones(.bodyBold))
            .padding(.leading, .bones(.medium))
            .allowsHitTesting(false)
        }
      )
      .onAppear {
        Task { @MainActor in
          UITextField.appearance().clearButtonMode = .whileEditing
        }
      }
  }
}
