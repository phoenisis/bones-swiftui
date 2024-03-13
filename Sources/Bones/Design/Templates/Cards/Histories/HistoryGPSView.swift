//
//  HistoryGPSView.swift
//
//
//  Created by Quentin PIDOUX on 29/12/2023.
//

import SwiftUI

public struct HistoryGPSView: View {
  let title: String
  let isAvailable: Bool
  let isHidden: Bool
  let activityName: String
  let activityIconUrl: String?
  let points: String?
  let member: (String?, String)?
  let didTap: () -> Void

  public init(title: String?, isAvailable: Bool, isHidden: Bool, activityName: String?, activityIconUrl: String?, points: String?, member: (String?, String)?, didTap: @escaping () -> Void) {
    self.title = title ?? ""
    self.isAvailable = isAvailable
    self.isHidden = isHidden
    self.activityName = activityName ?? ""
    self.activityIconUrl = activityIconUrl
    self.points = points
    self.member = member
    self.didTap = didTap
  }

  public var body: some View {
    Button(title) { didTap() }
      .buttonStyle(
        HistoryGPSButtonStyle(
          isAvailable: isAvailable, 
          isHidden: isHidden,
          activityName: activityName,
          activityIconUrl: activityIconUrl,
          points: points,
          member: member
        )
      )
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)
  }
}

struct HistoryGPSButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let isAvailable: Bool
  let isHidden: Bool
  let activityName: String
  let activityIconUrl: String?
  let points: String?
  let member: (String?, String)?

  func makeBody(configuration: Configuration) -> some View {
    VStack(
      alignment: .leading,
      content: {
        HStack(
          spacing: .bones(.large),
          content: {
            TagView(
              activityName,
              icon: nil,
              iconUrl: activityIconUrl,
              style: .default
            )
          }
        )

        configuration.label
          .font(.custom(.bones(.bodyBold)))
          .multilineTextAlignment(.leading)

        if let member {
          HStack(
            alignment: .center,
            spacing: .bones(.medium),
            content: {
              AvatarGroupView(size: .medium, type: .user, images: [member.0] )
              Text(member.1)
                .font(.custom(.bones(.smallBold)))
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
        } else if let points {
          Text(points)
            .font(.custom(.bones(.bodyBold)))
            .padding()
            .background(
              BonesPointsShape()
                .fill(Color.bones.primary)
            )
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
      }
    )
    .padding(.bones(.large))
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(bonesRadius: .bones(.large), style: .continuous)
        .fill(Color.bones.white)
        .shadow(radius: .bones(
          isAvailable 
            ? configuration.isPressed ? .close : .far
            : .none)
        )
    )
    .opacity(isHidden ? 0.5 : 1)
    .animation(.default, value: configuration.isPressed)
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed && isAvailable
    )
  }
}

#Preview {
  List {
    HistoryGPSView(
      title: "42 km en 2 jours",
      isAvailable: true,
      isHidden: false,
      activityName: "Ski",
      activityIconUrl: "https://picsum.photos/200",
      points: "42 pts",
      member: ("https://picsum.photos/70", "john DOE"),
      didTap: {}
    )

    HistoryGPSView(
      title: "42 km en 2 jours",
      isAvailable: true,
      isHidden: false,
      activityName: "Ski",
      activityIconUrl: "https://picsum.photos/200",
      points: "42 pts",
      member: nil,
      didTap: {}
    )

    HistoryGPSView(
      title: "42 km en 2 jours",
      isAvailable: false,
      isHidden: false,
      activityName: "deltaplane",
      activityIconUrl: "https://picsum.photos/200",
      points: nil,
      member: ("https://picsum.photos/70", "john DOE"),
      didTap: {}
    )

    HistoryGPSView(
      title: "42 km en 2 jours",
      isAvailable: false,
      isHidden: true,
      activityName: "Moonwalkedille",
      activityIconUrl: "https://picsum.photos/200",
      points: nil,
      member: nil,
      didTap: {}
    )
  }
  .listBackgroundColor(.bones(.AQILevel1))
  .listRowSpacing(16)
  .listStyle(.grouped)
}
