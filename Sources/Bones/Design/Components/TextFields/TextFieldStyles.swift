//
//  TextFieldStyles.swift
//  
//
//  Created by Quentin PIDOUX on 29/09/2023.
//

import SwiftUI

/// Extension to simplify the usage of `BonesDefaultTextFieldStyle`.
public extension TextFieldStyle where Self == BonesDefaultTextFieldStyle {
  /// A convenient static variable to initialize `BonesDefaultTextFieldStyle`.
  static var bones: Self { .init() }
}

/// A default style configuration for Text Fields.
public struct BonesDefaultTextFieldStyle: TextFieldStyle {
  /// Stylizes the body of the text field.
  public func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .font(.bones(.bodyBold))
      .foregroundStyle(Color.bones.textDark)
      .applyButtonMinHeight(minHeight: 40)
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

/// Extension to simplify the usage of `BonesSearchTextFieldStyle`.
public extension TextFieldStyle where Self == BonesSearchTextFieldStyle {
  /// A convenient static variable to initialize `BonesSearchTextFieldStyle`.
  static var bonesSearch: Self { .init() }
}

/// A search style configuration for Text Fields.
public struct BonesSearchTextFieldStyle: TextFieldStyle {
  /// Stylizes the body of the text field with a search icon.
  public func _body(configuration: TextField<Self._Label>) -> some View {
    HStack(alignment: .center, spacing: .bones(.medium)) {
      Image(.bones(.search))
      configuration
    }
    .font(.bones(.bodyBold))
    .foregroundStyle(Color.bones.textDark)
    .applyButtonMinHeight(minHeight: 40)
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

/// Extension to simplify the usage of `BonesSecureTextFieldStyle`.
public extension TextFieldStyle where Self == BonesSecureTextFieldStyle {
  /// A function to initialize `BonesSecureTextFieldStyle` with protection status and a security change handler.
  static func bonesSecure(_ isProtected: Bool, _ securityChanged: @escaping () -> Void) -> Self { .init(isProtected: isProtected, securityChanged: securityChanged) }
}

/// A secure text field style configuration with visibility toggle.
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
    .applyButtonMinHeight(minHeight: 40)
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

/// A secure text field with a visibility toggle.
public struct BonesSecureField: View {
  var titleKey: LocalizedStringKey
  @Binding var text: String
  @State var isShowingPassword: Bool = false
  @FocusState var isFieldFocus: FieldToFocus?

  var onSubmit: (() -> Void)?

  /// Initializes a new secure field view.
  public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onSubmit: (() -> Void)? = nil) {
    self.titleKey = titleKey
    self._text = text
    self.onSubmit = onSubmit
  }

  /// The body composed of a secure text field with a visibility toggle.
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

struct Preview_TextField: View {
  @State var field: String = ""

  var body: some View {
    @State var field: String = ""
    return  List {
      Section {
        TextField(
          text: $field,
          prompt: Text("Adresse email").foregroundColor(Color.bones.grey4),
          axis: .vertical
        ) {
          Text("Email address")
        }
        .lineLimit(4, reservesSpace: true)
        .textFieldStyle(.bones)
        .padding(.vertical, .bones(.medium))

        TextField(text: $field, prompt: Text("Adresse email")
          .foregroundColor(Color.bones.grey4)
        ) {
          Text("Email address")
        }
        .textFieldStyle(.bones)
        .padding(.vertical, .bones(.medium))
      } header: {
        Text("normal field")
          .font(.custom(.bones(.bodyBold)))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        TextField(text: $field, prompt: Text("Rechercher")
          .foregroundColor(Color.bones.grey4)
        ) {
          Text("Search term")
        }
        .textFieldStyle(.bonesSearch)
        .padding(.vertical, .bones(.medium))
      } header: {
        Text("search field")
          .font(.custom(.bones(.bodyBold)))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        BonesSecureField("Password", text: $field)
          .padding(.vertical, .bones(.medium))
      } header: {
        Text("secure field")
          .font(.custom(.bones(.bodyBold)))
          .foregroundStyle(Color.bones.textDark)
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_TextField()
}
