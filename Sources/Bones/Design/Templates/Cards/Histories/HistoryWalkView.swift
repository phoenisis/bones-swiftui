//
//  HistoryWalkView.swift
//
//
//  Created by Quentin PIDOUX on 28/12/2023.
//

import SwiftUI

public struct HistoryWalkView: View {
  let title: String
  let points: String?

  public init(title: String, points: String?) {
    self.title = title
    self.points = points
  }

  public var body: some View {
    HStack(
      alignment: .center,
      spacing: .bones(.large),
      content: {
        Text(title)
          .font(.custom(.bones(.bodyBold)))
          .multilineTextAlignment(.leading)
          .frame(maxWidth: .infinity, alignment: .leading)

        if let points {
          Text(points)
            .font(.custom(.bones(.bodyBold)))
            .padding()
            .background(
              BonesPointsShape()
                .fill(Color.bones.primary)
            )
        }
      }
    )
    .foregroundStyle(Color.bones.textDark)
    .padding(.horizontal, .bones(.large))
    .listRowSeparator(.hidden)
    .listRowBackground(
      RoundedRectangle(
        bonesRadius: .bones(.large),
        style: .continuous
      )
      .fill(Color.bones.white)
      .padding(.horizontal, .bones(.large))
    )
  }
}

#Preview {
  List {
    HistoryWalkView(title: "Title", points: "12 points")
    HistoryWalkView(title: "Title", points: nil)
  }
  .listStyle(.grouped)
  .listRowSpacing(16)
  .listBackgroundColor()
}
