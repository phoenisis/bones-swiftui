//
//  SwiftUIView.swift
//
//
//  Created by Quentin PIDOUX on 11/01/2024.
//

import SwiftUI

public struct PointsView: View {
  let text: String?

  public init(_ text: String?) {
    self.text = text
  }

  public var body: some View {
    if let text {
      Text(text)
        .font(.custom(.bones(.bodyBold)))
        .padding()
        .background(
          BonesEarnPointShape()
            .fill(Color.bones.primary)
        )
        .frame(maxWidth: .infinity, alignment: .trailing)
    } else {
      EmptyView()
    }
  }
}

#Preview {
  PointsView("123")
}
