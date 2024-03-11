//
//  SwiftUIView.swift
//
//
//  Created by Quentin PIDOUX on 26/09/2023.
//

import SwiftUI

public struct BonesFullPreview: View {
  public init() {}

  public var body: some View {
    NavigationView {
      List {
        Section {
          NavigationLink("Colors") {
            Preview_Colors()
              .navigationTitle("Colors")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Fonts") {
            Preview_Fonts()
              .navigationTitle("Fonts")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Sizes") {
            Preview_Sizes()
              .navigationTitle("Sizes")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Shadows") {
            Preview_Shadows()
              .navigationTitle("Shadows")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Icons") {
            Preview_Icons()
              .navigationTitle("Icons")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Shapes") {
            Previews_ShapeStyles()
              .navigationTitle("Shapes")
          }

        } header: {
          Text("Tokens")
            .font(.custom(.bones(.bodyBold)))
            .foregroundStyle(Color.bones.textDark)
        }

        Section {
          NavigationLink("Textfields") {
            Preview_TextField()
              .navigationTitle("Textfields")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Buttons") {
            Preview_ButtonStyles()
              .navigationTitle("Buttons")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Avatars") {
            Preview_BonesAvatarView()
              .navigationTitle("Avatars")
          }
          .font(.custom(.bones(.body)))    

          NavigationLink("Tags") {
            Preview_TagView()
              .navigationTitle("Tag")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Cards") {
            Preview_CardStyles()
              .navigationTitle("Cards")
          }
        } header: {
          Text("Components")
            .font(.custom(.bones(.bodyBold)))
            .foregroundStyle(Color.bones.textDark)
        }

        Section {
          NavigationLink("Chips group") {
            Preview_ChipGroupView()
              .navigationTitle("Chips group")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Avatars group") {
            Preview_AvatarGroupView()
              .navigationTitle("Avatars group")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Expandable text") {
            Preview_ExpandingText()
              .navigationTitle("Expandable text")
          }
          .font(.custom(.bones(.body)))
        } header: {
          Text("Templates")
            .font(.custom(.bones(.bodyBold)))
            .foregroundStyle(Color.bones.textDark)
        }  

        Section {
          NavigationLink("Social Action Bar") {
            Preview_SocialActionBarView()
              .navigationTitle("Social Action Bar")
          }
          .font(.custom(.bones(.body)))

          NavigationLink("Social Wall image") {
            Preview_SocialWallImageView()
              .navigationTitle("Social Wall image")
          }
          .font(.custom(.bones(.body)))  

          NavigationLink("Social Wall sender") {
            Preview_SocialWallSenderView()
              .navigationTitle("Social Wall sender")
          }
          .font(.custom(.bones(.body)))  

          NavigationLink("Social Wall Likes by") {
            Preview_SocialWallLikesBy()
              .navigationTitle("Social Wall Likes by")
          }
          .font(.custom(.bones(.body)))
        } header: {
          Text("Templates - Social Wall")
            .font(.custom(.bones(.bodyBold)))
            .foregroundStyle(Color.bones.textDark)
        }

        Section {
          NavigationLink("Social Wall Post") {
            Preview_SocialWallPostView()
              .navigationTitle("Social Wall Post")
          }
          .font(.custom(.bones(.body)))
        } header: {
          Text("Exemples")
            .font(.custom(.bones(.bodyBold)))
            .foregroundStyle(Color.bones.textDark)
        }
      }
      .listBackgroundColor()
      .navigationTitle("Bones Design System")
    }
    .tint(.bones(.textDark))
    .listStyle(.plain)
  }
}

#Preview {
  BonesFullPreview()
}
