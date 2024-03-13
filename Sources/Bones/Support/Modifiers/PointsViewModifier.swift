//
//  PointsViewModifier.swift
//
//
//  Created by Quentin PIDOUX on 11/01/2024.
//

import SwiftUI

struct PointsViewModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.custom(.bones(.bodyBold)))
      .padding()
      .background(
        BonesPointsShape()
          .fill(Color.bones.primary)
      )
      .frame(maxWidth: .infinity, alignment: .trailing)
  }
}

#Preview {
  Text("123")
    .bonesStyle(.points)
//    .modifier(PointsViewModifier())
}
