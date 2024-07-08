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
    configuration
      .font(.bones(.bodyBold))
      .frame(alignment: .leading)
      .padding(.horizontal, .bones(.medium))
      .padding(.vertical, .bones(.medium))
      .padding(.trailing, .bones(.large))
      .frame(minHeight: 40)
      .foregroundStyle(Color.bones.textDark)
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
        alignment: .trailing,
        content: {
          Button(
            action: { securityChanged() },
            label: {
              Image( isProtected
                ? .bones(.passwordOn)
                : .bones(.passwordOff)
              )
            }
          )
          .padding(.trailing, .bones(.medium))
        }
      )
      .tint(Color.bones.textDark)
      .disableAutocorrection(true)
      .autocapitalization(.none)
  }
}
