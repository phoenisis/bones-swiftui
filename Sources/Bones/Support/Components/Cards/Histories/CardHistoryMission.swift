//
//  CardHistoryMission.swift
//
//
//  Created by Quentin PIDOUX on 28/12/2023.
//

import SwiftUI

public struct CardHistoryMission: View {
  let title: String
  let points: String?
  let isTeam: Bool
  let isOneTime: Bool
  let isAvailable: Bool
  let activityName: String
  let activityIconUrl: String?
  let members: [(String?, String)]?
  let didTap: () -> Void
  let didTapMembers: () -> Void

  public init(title: String, points: String?, isTeam: Bool, isOneTime: Bool, isAvailable: Bool, activityName: String, activityIconUrl: String?, members: [(String?, String)]?, didTap: @escaping () -> Void, didTapMembers: @escaping () -> Void) {
    self.title = title
    self.points = points
    self.isTeam = isTeam
    self.isOneTime = isOneTime
    self.isAvailable = isAvailable
    self.activityName = activityName
    self.activityIconUrl = activityIconUrl
    self.members = members
    self.didTap = didTap
    self.didTapMembers = didTapMembers
  }

  public var body: some View {
    Button("") { didTap() }
      .buttonStyle(
        BonesCardButton(
          description: title,
          showBorder: false,
          descriptionStyle: .bones(.bodyBold),
          isAvailable: isAvailable,
          content: {},
          footer: {
            footer
          }, topAction: {
            topAction
          }
        )
      )
      .backgroundColor(.bones.white)
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)
  }

  @ViewBuilder var footer: some View {
    if members != nil || points != nil {
      HStack(
        alignment: .center,
        spacing: .bones(.medium),
        content: {
          if let members {
            if members.isEmpty == false {
              if members.count > 1 {
                Button("") { didTap() }
                  .buttonStyle(BonesCardButton(content: {
                    HStack(alignment: .center, spacing: .bones(.medium), content: {
                      AvatarGroupView(size: .medium, type: .user, images: members.compactMap { $0.0 })
                      Text("history_contributors_users_number")
                        .font(.custom(.bones(.smallBold)))
                    })
                  }))
                  .disabled(false)
              } else {
                AvatarGroupView(size: .medium, type: .user, images: members.compactMap { $0.0 })
                Text(members.first!.1)
                  .font(.custom(.bones(.smallBold)))
              }
            }
          }
          Spacer(minLength: 0)

          if let points {
            Text(points)
              .font(.custom(.bones(.bodyBold)))
              .padding()
              .background(
                BonesPointsShape()
                  .fill(Color.bones.primary)
              )
              .frame(alignment: .trailing)
          }
        }
      )
    }
  }

  @ViewBuilder var topAction: some View {
    ScrollView(.horizontal) {
      HStack(
        spacing: .bones(.large),
        content: {
          TagView(
            isTeam ? "mission_team" : isOneTime ? "mission_user_onetime" : "mission_user",
            icon: isTeam ? .team : .user,
            style: .default
          )
          if activityName.isEmpty == false {
            TagView(activityName, icon: nil, iconUrl: activityIconUrl, style: .default)
          }
        }
      )
      .padding(1)
    }
    .scrollIndicators(.hidden)
    .frame(alignment: .leading)
  }
}

#Preview {
  List {
    CardHistoryMission(
      title: "42 km en 1 semaine",
      points: "23 pts",
      isTeam: false,
      isOneTime: false,
      isAvailable: true,
      activityName: "moonwalk",
      activityIconUrl: "https://picsum.photos/50",
      members: [("https://picsum.photos/500", "Patrick Johns")],
      didTap: {},
      didTapMembers: {  }
    )

    CardHistoryMission(
      title: "42 min",
      points: "12 pts",
      isTeam: false,
      isOneTime: true,
      isAvailable: true,
      activityName: "jetski",
      activityIconUrl: "https://picsum.photos/50",
      members: [
        ("https://picsum.photos/500", "Patrick Johns"),
        ("https://picsum.photos/560", "Patrick Johns"),
        ("https://picsum.photos/570", "Patrick Johns"),
      ],
      didTap: {},
      didTapMembers: {  }
    )

    CardHistoryMission(
      title: "650 km",
      points: "650 pts",
      isTeam: true,
      isOneTime: false,
      isAvailable: false,
      activityName: "jetpack",
      activityIconUrl: "https://picsum.photos/50",
      members: [
        ("https://picsum.photos/500", "Patrick Johns"),
        ("https://picsum.photos/560", "Patrick Johns"),
        ("https://picsum.photos/570", "Patrick Johns"),
      ],
      didTap: {},
      didTapMembers: {  }
    )
  }
  .listStyle(.plain)
  .listRowSpacing(16)
  .listBackgroundColor(.bones(.AQILevel1))
}
