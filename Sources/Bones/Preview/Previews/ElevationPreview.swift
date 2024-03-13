//
//  ElevationPreview.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

// Previews for different shadow styles.
fileprivate struct ShadowPreview: View {
  var shadowType: ShadowStyle.BonesShadowToken
  var name: String

  var body: some View {
    HStack {
      Text(name)
        .font(.custom(.bones(.body)))
      Spacer()
      Rectangle()
        .foregroundStyle(
          Color.bones.primary
            .shadow(.bones.drop(shadowType))
        )
        .frame(width: 50, height: 50)

      Rectangle()
        .foregroundStyle(
          Color.bones.white
            .shadow(.bones.inner(shadowType))
        )
        .frame(width: 50, height: 50)
    }
    .previewDisplayName(name)
  }
}

struct Preview_Shadows: View {
  var body: some View {
    List {
      ForEach(ShadowStyle.BonesShadowToken.allCases) { shadow in
        ShadowPreview(shadowType: shadow, name: shadow.id)
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_Shadows()
}
