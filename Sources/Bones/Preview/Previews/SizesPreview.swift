//
//  SizesPreview.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

// Previews to visualize the different sizes of padding and radius.
fileprivate struct PaddingRadiusPreview: View {
  var type: PaddingRadiusType
  var name: String

  enum PaddingRadiusType {
    case padding(BonesSpacing)
    case radius(BonesRadius)
  }

  var body: some View {
    HStack {
      Text(name)
        .font(.custom(.bones(.body)))
      Spacer()
      if case .padding(let value) = type {
        Text("")
          .padding(value)
          .background(Color.bones.primary)

      } else if case .radius(let value) = type {
        RoundedRectangle(bonesRadius: value, style: .continuous)
          .foregroundStyle(
            Color.bones.primary
              .shadow(.bones.drop(.close))
          )
          .frame(width: 64, height: 64)
      }
    }
    .previewDisplayName(name)
  }
}

struct Preview_Sizes: View {
  var body: some View {
    List {
      Section {
        ForEach(CGFloat.BonesSpacing.allCases) { padding in
          PaddingRadiusPreview(type: .padding(.bones(padding)), name: padding.id)
        }
      } header: {
        Text("Padding")
          .font(.custom(.bones(.bodyBold)))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        ForEach(CGFloat.BonesRadius.allCases) { radius in
          PaddingRadiusPreview(type: .radius(.bones(radius)), name: radius.id)
        }
      } header: {
        Text("Radius")
          .font(.custom(.bones(.bodyBold)))
          .foregroundStyle(Color.bones.textDark)
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_Sizes()
}
