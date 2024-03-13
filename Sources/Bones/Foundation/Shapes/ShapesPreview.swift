//
//  ShapesPreview.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

struct Previews_ShapeStyles : View {
  var body: some View {
    List {
      Section {
        BonesShieldShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(width: 50, height: 50)
      } header: {
        Text("Shield")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }
      Section {
        BonesBubbleDownShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(width: 50, height: 50)
      } header: {
        Text("Bubble down")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        BonesObsidianProfileShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(height: 100)
          .frame(maxWidth: .infinity)
      } header: {
        Text("Obsidian Profile")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        BonesPointsShape()
          .fill(Color.bones.primary)
          .shadow(radius: .bones(.close))
          .frame(height: 100)
          .frame(maxWidth: .infinity)
      } header: {
        Text("Points")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }
    }
  }
}

#Preview {
  Previews_ShapeStyles()
}
