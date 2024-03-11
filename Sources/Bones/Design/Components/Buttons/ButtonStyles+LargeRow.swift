//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 02/11/2023.
//

import SwiftUI

struct ButtonLargeRow: View {
  var imageUrl: String?
  var icon: BonesIconToken?

  var body: some View {
    HStack(alignment: .center, spacing: .bones(.medium), content: {
      RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        .fill(Color.bones.grey2)
        .frame(width: 72, height: 72)
        .overlay(alignment: .center) {
          if let icon {
            BonesIcon(
              icon: .bones(icon),
              renderingMode: .original
            )
            .frame(width: 48, height: 48)
          }
          else if let imageUrl {
            CachedAsyncImage(url: URL(string: imageUrl)) { image in image.resizable()
            } placeholder: {
              /// Placeholder with a team icon and a progress view until the image loads.
              ZStack(alignment: .center) {
                ProgressView()
              }
              .foregroundStyle(Color.bones.grey4)
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fill)
            .clipShape( RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
          }
        }
      VStack(alignment: .leading, spacing: .bones(.medium), content: {
        Text("Classement saison")
          .textCase(.uppercase)
          .font(.custom(.bones(.body)))
          .fontWeight(.black)
        Text("1er septembre 2023 - 30 septembre 2023")
          .font(.custom(.bones(.extraSmall)))
      })
      Spacer()
      BonesIcon(icon: .bones(.chevronRight))
        .frame(width: 16, height: 16)
    })
    .padding(.bones(.medium))
    .listRowInsets(EdgeInsets())
    .listRowSeparator(.hidden)
    .listRowBackground(
      RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
      .fill(Color.bones.white)
      .shadow(radius: .bones(.close))
    )
  }
}

#Preview {
  List {
    ButtonLargeRow(imageUrl: "https://picsum.photos/300")
    ButtonLargeRow(icon: .bolt)
  }
  .listRowSpacing(8)
  .listBackgroundColor()
}
