//
//  SocialCommentCardView.swift
//
//
//  Created by Quentin PIDOUX on 06/12/2023.
//

import SwiftUI

public struct SocialCommentView: View {
  var senderImage: String?
  var senderName: String
  var createdAt: Date
  var comment: String

  var isLiked: Bool
  var isUser: Bool
  var likesCount: Int

  var didUserTapped: () -> Void
  var didLikedTapped: () -> Void
  var didLikesByTapped: () -> Void
  var didReportTapped: () -> Void
  var didDeleteTapped: () -> Void

  public init(senderImage: String?, senderName: String, createdAt: Date, comment: String, isLiked: Bool, isUser: Bool, likesCount: Int, didUserTapped: @escaping () -> Void, didLikedTapped: @escaping () -> Void, didLikesByTapped: @escaping () -> Void, didReportTapped: @escaping () -> Void, didDeleteTapped: @escaping () -> Void) {
    self.senderImage = senderImage
    self.senderName = senderName
    self.createdAt = createdAt
    self.comment = comment
    self.isLiked = isLiked
    self.isUser = isUser
    self.likesCount = likesCount
    self.didUserTapped = didUserTapped
    self.didLikedTapped = didLikedTapped
    self.didLikesByTapped = didLikesByTapped
    self.didReportTapped = didReportTapped
    self.didDeleteTapped = didDeleteTapped
  }

  public var body: some View {
    BonesCard(description: comment,
              showBorder: false,
              radius: .large,
              shadowStyle: .none,
              descriptionStyle: .bones(.small)
    ) { } footer: {
      HStack(
        alignment: .center,
        spacing: .bones(.medium),
        content: {
          Button(
            action: {
              HapticsProvider.sendHapticFeedback(.light())
              didLikedTapped()
            }, label: {
              HStack(alignment: .center) {
                ZStack {
                  BonesIcon(
                    icon: .bones(
                      isLiked
                        ? .likeFill
                        : .like
                    ), renderingMode: .template)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(
                      isLiked
                        ? Color.bones.primary
                        : Color.bones.textDark
                    )
                  BonesIcon(
                    icon: .bones(.like),
                    renderingMode: .template)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(
                      Color.bones.textDark
                    )
                }
                .changeEffect(
                  .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
                    Image(systemName: "heart.fill")
                      .foregroundStyle(
                        isLiked
                          ? Color.bones.primary
                          : Color.clear
                      )
                  }, value: isLiked)
              }
            }
          )

          Button(action: {
            didLikesByTapped()
          }, label: {
            Text("\(likesCount) j'aime")
              .font(.custom(.bones(.smallBold)))
          })
          .buttonStyle(.bones(.defaultText(1)))
          .opacity(likesCount > 0 ? 1 : 0)
          .allowsHitTesting(likesCount > 0)
          .animation(.default, value: isLiked)

          Spacer()
          if isUser {
            Button(
              role: .destructive,
              action: {
                didDeleteTapped()
              }, label: {
                Text("Delete")
                  .font(.custom(.bones(.smallBold)))
                  .foregroundStyle(Color.bones.alert)
              }
            )
            .buttonStyle(.bones(.defaultText(1)))
          } else {
            Button(action: {
              didReportTapped()
            }, label: {
              Text("social_report_post_action")
                .font(.custom(.bones(.smallBold)))
            })
            .buttonStyle(.bones(.defaultText(1)))
          }
        }
      )
    } topAction: {
      SocialWallSenderView(
        imageUrl: senderImage,
        userName: senderName,
        userTeam: nil,
        createdAt: createdAt,
        isMoreVisible: false,
        isInlineLayout: true
      ) { didUserTapped() }
        userTeamTapped: { }
        moreTapped: { }
    }
  }
}


struct Preview_SocialCommentView: View {
  @State var isLiked = false
  @State var likesCount = 12
  @State var isLiked1 = true
  @State var likes1Count = 1
  @State var isLiked2 = false
  @State var likes2Count = 0

  var body: some View {
    ScrollView {
      LazyVGrid(columns: [
        GridItem(.flexible(minimum: 0, maximum: .infinity))
      ], spacing: 16) {
        //    List {
        SocialCommentView(
          senderImage: "https://picsum.photos/200/300",
          senderName: "Suzon Lemoine",
          createdAt: Date(timeIntervalSince1970: 1678972600),
          comment: "Adipisicing sit sint exercitation aliqua consequat eu laborum adipisicing excepteur do.",
          isLiked: isLiked,
          isUser: true,
          likesCount: likesCount,
          didUserTapped: {},
          didLikedTapped: {
            isLiked.toggle()
            likesCount += isLiked ? 1 : -1
          },
          didLikesByTapped: {},
          didReportTapped: {},
          didDeleteTapped: {}
        )

        SocialCommentView(
          senderImage: "https://picsum.photos/250",
          senderName: "Aurore Maillard",
          createdAt: Date(timeIntervalSince1970: 1688873600),
          comment: """
          Incididunt eiusmod qui ad. Mollit exercitation aliqua exercitation minim velit velit cupidatat aliquip consectetur adipisicing ex laboris. Elit incididunt ex sint eu ut dolor eu veniam anim consectetur id cillum cupidatat.
          Sit nisi culpa nostrud aliqua enim do nostrud cillum occaecat anim. Ad laborum enim tempor consequat anim et enim duis commodo velit ad pariatur est. Incididunt irure in minim pariatur.
          """,
          isLiked: isLiked1,
          isUser: false,
          likesCount: likes1Count,
          didUserTapped: {},
          didLikedTapped: {
            isLiked1.toggle()
            likes1Count += isLiked1 ? 1 : -1
          },
          didLikesByTapped: {},
          didReportTapped: {},
          didDeleteTapped: {}
        )

        SocialCommentView(
          senderImage: "https://picsum.photos/300",
          senderName: "Stanislas Clement",
          createdAt: Date(timeIntervalSince1970: 1678972600),
          comment: "Veniam pariatur aliquip aliquip elit. Id aliqua amet do consectetur veniam est aliquip adipisicing.",
          isLiked: isLiked2,
          isUser: false,
          likesCount: likes2Count,
          didUserTapped: {},
          didLikedTapped: {
            isLiked2.toggle()
            likes2Count += isLiked2 ? 1 : -1
          },
          didLikesByTapped: {},
          didReportTapped: {},
          didDeleteTapped: {}
        )
      }
    }
    //    .listStyle(.grouped)
    //    .listRowSpacing(8)
    .listBackgroundColor(.bones(.AQILevel2))
  }
}

#Preview {
  Preview_SocialCommentView()
}
