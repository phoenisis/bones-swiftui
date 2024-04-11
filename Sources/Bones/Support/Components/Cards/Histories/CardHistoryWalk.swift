//
//  HistoryWalkView.swift
//
//
//  Created by Quentin PIDOUX on 28/12/2023.
//

import SwiftUI

public struct CardHistoryWalk: View {
  let title: String
  let points: String?

  public init(title: String, points: String?) {
    self.title = title
    self.points = points
  }

  public var body: some View {
    BonesCard(
      title,
      radius: .large,
      shadowStyle: .none,
      titleStyle: .bones(.bodyBold),
      content: {},
      topAction: {
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
    .backgroundColor(Color.bones.white)
    .listRowSeparator(.hidden)
    .listRowBackground(Color.clear)
  }
}

#Preview {
  List {
    CardHistoryWalk(title: "Title", points: "12 points")
    CardHistoryWalk(title: "Title", points: nil)
  }
  .listStyle(.grouped)
  .listRowSpacing(16)
  .listBackgroundColor()
}
