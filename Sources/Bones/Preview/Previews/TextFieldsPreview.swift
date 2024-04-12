//
//  TextFieldsPreview.swift
//  
//
//  Created by Quentin PIDOUX on 29/09/2023.
//

import SwiftUI

/// A secure text field with a visibility toggle.

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
