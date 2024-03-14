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
    HStack(alignment: .center, spacing: .bones(.medium)) {
      Image(.bones(.search))
      configuration
    }
    .font(.bones(.bodyBold))
    .foregroundStyle(Color.bones.textDark)
    .frame(minHeight: 40)
    .padding(.horizontal, .bones(.large))
    .padding(.vertical, .bones(.medium))
    .background(
      RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        .overlay(content: {
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .stroke(Color.bones.grey2, lineWidth: 2)
        })
        .foregroundStyle(
          Color.bones.white
            .shadow(.bones.inner(.close))
        )
    )
    .onAppear {
      UITextField.appearance().clearButtonMode = .whileEditing
    }
  }
}
