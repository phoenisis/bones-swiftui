//
//  SecureField.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

/// A custom secure text field that allows toggling between hiding and showing the password.
public struct BonesSecureField: View {
  var titleKey: LocalizedStringKey
  @Binding var text: String
  @State var isShowingPassword: Bool = false
  @FocusState var isFieldFocus: FieldToFocus?
  
  var onSubmit: (() -> Void)?
  
  public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onSubmit: (() -> Void)? = nil) {
    self.titleKey = titleKey
    self._text = text
    self.onSubmit = onSubmit
  }
  
  public var body: some View {
    VStack {
      Group {
        if isShowingPassword {
          TextField(titleKey, text: $text, prompt: {
            Text(titleKey)
              .foregroundColor(.bones.grey4)
          }())
            .textFieldStyle(.bonesSecure(isShowingPassword, {
              isShowingPassword.toggle()
            }))
            .onSubmit {
              onSubmit?()
            }
        } else {
          SecureField(titleKey, text: $text, prompt: {
            Text(titleKey)
              .foregroundColor(.bones.grey4)
          }())
            .focused($isFieldFocus, equals: .secureField)
            .textFieldStyle(.bonesSecure(isShowingPassword, {
              isShowingPassword.toggle()
            }))
            .onSubmit {
              onSubmit?()
            }
        }
      }
      .disableAutocorrection(true)
      .autocapitalization(.none)
    }
    .onChange(of: isShowingPassword) {
      isFieldFocus = isShowingPassword ? .textField : .secureField
    }
  }
  
  enum FieldToFocus {
    case secureField, textField
  }
}
