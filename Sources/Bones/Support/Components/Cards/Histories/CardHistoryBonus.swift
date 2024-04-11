//
//  CardHistoryBonus.swift
//
//
//  Created by Quentin PIDOUX on 29/12/2023.
//

import SwiftUI

public struct CardHistoryBonus: View {
  let title: String
  let points: String?

  public init(title: String, points: String?) {
    self.title = title
    self.points = points
  }

  public var body: some View {
    BonesCard (
      description: title,
      radius: .large,
      shadowStyle: .none,
      descriptionStyle: .bones(.bodyBold),
      content: {},
      footer: {
        if let points {
          Text(points)
            .font(.custom(.bones(.bodyBold)))
            .padding()
            .background(
              BonesPointsShape()
                .fill(Color.bones.primary)
            )
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
      }, topAction: {
        TagView("Bonus", icon: nil, style: .default)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    )
    .backgroundColor(.bones.white)
    .listRowSeparator(.hidden)
    .listRowBackground(Color.clear)
  }
}

#Preview {
  List {
    CardHistoryBonus(title: "Nulla adipisicing deserunt in magna mollit consequat. Magna cupidatat ut proident ut non duis est velit enim.", points: "42 pts")
    CardHistoryBonus(title: "Irure velit cupidatat ipsum ut esse amet eu dolore incididunt nulla enim excepteur commodo sit ad. Nulla magna enim enim proident quis. Dolore magna eiusmod irure in qui qui esse voluptate dolor magna ullamco irure sint ut occaecat. Nostrud et enim adipisicing culpa fugiat in ea ex occaecat. Irure minim laborum commodo enim aute officia irure dolor consequat ullamco irure culpa laborum veniam. Enim nostrud dolore magna cupidatat.", points: "42 pts")
    CardHistoryBonus(title: "eu sunt dolor duis.", points: nil)
  }
  .listBackgroundColor(.bones(.AQILevel1))
  .listRowSpacing(16)
  .listStyle(.grouped)
}
