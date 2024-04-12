//
//  SecureTextFieldStyle.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

public struct BonesSecureTextFieldStyle: TextFieldStyle {
  let isProtected: Bool
  var securityChanged: () -> Void

  /// Initializes a new style with protection status and a security change handler.
  public init(isProtected: Bool, securityChanged: @escaping () -> Void) {
    self.isProtected = isProtected
    self.securityChanged = securityChanged
  }

  /// Stylizes the body of the secure text field with a visibility toggle button.
  public func _body(configuration: TextField<Self._Label>) -> some View {
    HStack(alignment: .center, content: {
      configuration
        .font(.bones(.bodyBold))
      Button(action: { securityChanged() }, label: {
        Image( isProtected
          ? .bones(.passwordOn)
          : .bones(.passwordOff)
        )
      })
    })
    .frame(alignment: .leading)
    .frame(minHeight: 40)
    .padding(.horizontal, .bones(.large))
    .padding(.vertical, .bones(.medium))
    .foregroundStyle(Color.bones.textDark)
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
    .tint(Color.bones.textDark)
    .disableAutocorrection(true)
    .autocapitalization(.none)
  }
}
