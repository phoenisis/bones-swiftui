//
//  CardHistoryQuiz.swift
//
//
//  Created by Quentin PIDOUX on 28/12/2023.
//

import SwiftUI

public struct CardHistoryQuiz: View {
  let isActive: Bool
  let title: String
  let imageUrl: String?
  let points: String?
  let members: [(String?, String)]
  let didTap: () -> Void
  let didTapOnMembers: () -> Void

  public init(isActive: Bool = true, title: String, imageUrl: String?, points: String?, members: [(image: String?, String)], didTap: @escaping () -> Void, didTapOnMembers: @escaping () -> Void) {
    self.isActive = isActive
    self.title = title
    self.imageUrl = imageUrl
    self.points = points
    self.members = members
    self.didTap = didTap
    self.didTapOnMembers = didTapOnMembers
  }

  public var body: some View {
    Button("") { didTap() }
      .buttonStyle(
        BonesCardButton(
          description: "",
          showBorder: false,
          titleStyle: .bones(.small),
          radius: .large,
          content: {
            HStack(
              spacing: .bones(.large),
              content: {
                if let imageUrl {
                  CachedAsyncImage(url: URL(string: imageUrl)) { image in image
                    .resizable()
                  } placeholder: {
                    ProgressView()
                      .frame(maxWidth: .infinity, alignment: .center)
                      .foregroundStyle(Color.bones.grey4)
                  }
                  .frame(width: 72, height: 72)
                  .cornerRadius(.bones(.medium))
                }
                Text(title)
                  .font(.custom(.bones(.bodyBold)))
                  .lineLimit(3)
              }
            )
          },
          footer: {
            if members.isEmpty == false {
              if members.count > 1 {
                Button("") { didTapOnMembers() }
                  .buttonStyle(
                    BonesCardButton(
                      showBorder: true,
                      radius: .medium,
                      shadowStyle: .medium,
                      content: {
                        HStack(alignment: .center, spacing: .bones(.medium), content: {
                          AvatarGroupView(size: .medium, type: .user, images: members.compactMap { $0.0 })
                          Text("history_answers_users_number")
                            .font(.custom(.bones(.smallBold)))
                        })
                      }
                    )
                  )

                  .zIndex(99)
              } else {
                HStack(
                  alignment: .center,
                  spacing: .bones(.medium),
                  content: {
                    AvatarGroupView(size: .medium, type: .user, images: members.compactMap { $0.0 })
                    Text(members.first!.1)
                      .font(.custom(.bones(.smallBold)))
                  }
                )
              }
            }
          },
          topAction: {
            HStack(
              spacing: .bones(.large),
              content: {
                TagView("Quiz", icon: .questionMark, style: .default)
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
          }
        )
      )
      .backgroundColor(.bones.white)
      .tint(.bones(.textDark))
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)
  }
}

#Preview {
  List {
    CardHistoryQuiz(
      isActive: true,
      title: "Eu ad ea sit veniam laboris aliquip sint consectetur. Adipisicing laborum elit ad. Non est reprehenderit adipisicing consectetur anim cillum nisi aliqua sunt sint do.",
      imageUrl: "https://picsum.photos/60",
      points: "12 pts",
      members: [
        (image: "https://picsum.photos/50", displayName: "John DOE"),
        (image: "https://picsum.photos/60", displayName: "John DOE"),
        (image: "https://picsum.photos/70", displayName: "John DOE"),
      ],
      didTap: {print("didTap")},
      didTapOnMembers: { print("didTapOnMembers") }
    )

    CardHistoryQuiz(
      isActive: false,
      title: "Id magna duis nulla elit consequat exercitation commodo do. Cupidatat nulla magna irure sit consequat dolor labore do aute sunt culpa eiusmod. Aliquip labore ut exercitation fugiat ex nostrud aliquip Lorem commodo aute.",
      imageUrl: "https://picsum.photos/70",
      points: "12 pts",
      members: [
        (image: "https://picsum.photos/50", displayName: "John DOE")
      ],
      didTap: {},
      didTapOnMembers: {}
    )

    CardHistoryQuiz(
      isActive: false,
      title: "Proident anim tempor amet veniam elit duis ut ad ipsum commodo duis exercitation ad. Quis quis ipsum voluptate tempor cupidatat culpa et qui est Lorem sunt nostrud ea ipsum aliquip. Amet incididunt dolore veniam commodo.",
      imageUrl: "https://picsum.photos/80",
      points: "12 pts",
      members: [],
      didTap: {},
      didTapOnMembers: {}
    )

    CardHistoryQuiz(
      isActive: false,
      title: "Aliquip quis cillum consequat aliquip labore do. Veniam sunt mollit ad commodo laborum nisi sint sint occaecat dolor irure amet commodo. In excepteur sunt nisi.",
      imageUrl: nil,
      points: nil,
      members: [],
      didTap: {},
      didTapOnMembers: {}
    )
  }
  .listBackgroundColor(.bones(.AQILevel1))
  .listRowSpacing(16)
  .listStyle(.grouped)
}


public struct CardStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  public init() {}

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background(
        RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
          .fill(
            Color.bones.white
              .shadow(.bones.drop(
                isEnabled
                  ? configuration.isPressed ? .none : .reallyClose
                  : .none
              ))
          )
          .animation(.default, value: configuration.isPressed)
      )
      .conditionalEffect(
        .pushDown,
        condition: configuration.isPressed && isEnabled
      )
      .changeEffect(
        .feedback(
          hapticImpact: .light
        ),
        value: configuration.isPressed && isEnabled
      )
  }
}

