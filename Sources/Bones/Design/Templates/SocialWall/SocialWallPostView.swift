//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 31/10/2023.
//

import SwiftUI

/// A SwiftUI view representing a social wall with likes by view feature.
public struct SocialWallPostView: View {
  let userImage: String?
  let senderImage: String?
  let senderName: String
  let senderTeam: String?
  let createdAt: Date
  let isMoreActionVisible: Bool

  let postImage: String?
  let postTagName: String?
  let postTagPoints: String?

  let postText: String?

  let likesCount: Int
  let commentsCount: Int
  let isLiked: Bool
  let isSharable: Bool
  let isPinned: Bool

  let likesByImages: [String]
  let likesByText: String

  let didTap: () -> Void

  let didTapUserName: () -> Void
  let didTapUserTeam: () -> Void
  let didTapSenderMore: () -> Void

  let didTapLike: () -> Void
  let didTapComment: () -> Void
  let didTapNewComment: () -> Void
  let didTapShare: () -> Void

  let didTapLikesBy: () -> Void

  public init(userImage: String?, senderImage: String?, senderName: String, senderTeam: String?, createdAt: Date, isMoreActionVisible: Bool, postImage: String?, postTagName: String?, postTagPoints: String?, postText: String?, likesCount: Int, commentsCount: Int, isLiked: Bool, isSharable: Bool, isPinned: Bool, likesByImages: [String], likesByText: String, didTap: @escaping () -> Void, didTapUserName: @escaping () -> Void, didTapUserTeam: @escaping () -> Void, didTapSenderMore: @escaping () -> Void, didTapLike: @escaping () -> Void, didTapComment: @escaping () -> Void, didTapNewComment: @escaping () -> Void, didTapShare: @escaping () -> Void, didTapLikesBy: @escaping () -> Void) {
    self.userImage = userImage
    self.senderImage = senderImage
    self.senderName = senderName
    self.senderTeam = senderTeam
    self.createdAt = createdAt
    self.isMoreActionVisible = isMoreActionVisible
    self.postImage = postImage
    self.postTagName = postTagName
    self.postTagPoints = postTagPoints
    self.postText = postText
    self.likesCount = likesCount
    self.commentsCount = commentsCount
    self.isLiked = isLiked
    self.isSharable = isSharable
    self.isPinned = isPinned
    self.likesByImages = likesByImages
    self.likesByText = likesByText
    self.didTap = didTap
    self.didTapUserName = didTapUserName
    self.didTapUserTeam = didTapUserTeam
    self.didTapSenderMore = didTapSenderMore
    self.didTapLike = didTapLike
    self.didTapShare = didTapShare
    self.didTapLikesBy = didTapLikesBy
    self.didTapComment = didTapComment
    self.didTapNewComment = didTapNewComment
  }

  public var body: some View {
    VStack(
      alignment: .leading,
      spacing: .bones(.medium),
      content: {
        SocialWallSenderView(
          imageUrl      : senderImage,
          userName      : senderName,
          userTeam      : senderTeam,
          createdAt     : createdAt,
          isMoreVisible : isMoreActionVisible
        ) {
          didTapUserName()
        } userTeamTapped: {
          didTapUserTeam()
        } moreTapped: {
          didTapSenderMore()
        }
        .zIndex(10)

        if let postImage {
          SocialWallImageView(
            postImage,
            postTagName: postTagName,
            points: postTagPoints,
            didDoubleTap: {
              didTapLike()
            }
          )
          .changeEffect(
            .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
              Image(systemName: "heart.fill")
                .foregroundStyle(Color.bones.primary)
            }, value: isLiked)
          .clipped()
          .zIndex(1)
        }

        if let postText {
          ExpandingText(
            postText,
            font: .body,
            isExpanded: false)
          .foregroundStyle(Color.bones.textDark)
          .zIndex(2)
        }

        SocialActionBarView(
          isLiked: isLiked,
          likeCount: likesCount,
          commentCount: commentsCount,
          points: postTagPoints,
          isSharable: isSharable,
          isPinned: isPinned
        ) {
          didTapLike()
        } commentTapped: {
          didTapComment()
        } seeLikedTapped: {
          didTapLikesBy()
        } shareTapped: {
          didTapShare()
        }
        .zIndex(2)

        Button(action: {
          didTapNewComment()
        }, label: {
          HStack(
            alignment: .center,
            spacing: .bones(.medium),
            content: {
              if let userImage {
                BonesAvatarView(size: .medium, avatarType: .user, imageUrl: userImage)
              }
              Text("SOCIAL_ADD_POST_COMMENT")
                .font(.custom(.bones(.small)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.bones.textDark)
                .padding(.bones(.medium))
                .background(
                  RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                    .fill(Color.bones.grey1)
                )
            }
          )
        })
        .padding(.top, .bones(.medium))
        .zIndex(2)
      }
    )
    .frame(minHeight: postImage != nil
           ? UIScreen.main.bounds.width
           : 100)

    .padding(.bones(.large))
    .background(
      RoundedRectangle(bonesRadius: .bones(.large), style: .continuous)
        .fill(Color.bones.white)
    )
    .frame(maxWidth: .infinity, alignment: .leading)
    .listRowBackground(Color.clear)
    .listRowInsets(EdgeInsets())
    .listRowSeparator(.hidden)
  }
}


struct Preview_SocialWallPostView: View {
  @State var isLiked: Bool = false
  @State var isLiked2: Bool = false

  @State var isCommentSheetPresented: Bool = false

  var body: some View {
    ScrollView {
      LazyVGrid(
        columns: [
          GridItem(.flexible(minimum: 0, maximum: .infinity))
        ],
        spacing: 16,
        content: {
          SocialWallPostView(
            userImage: "https://picsum.photos/100",
            senderImage: "https://picsum.photos/200",
            senderName: "Romane Pierre",
            senderTeam: "Élégant Frais Frites",
            createdAt: Date(timeIntervalSince1970: 1701774464),
            isMoreActionVisible: true,
            postImage: "https://picsum.photos/400/800",
            postTagName: nil,
            postTagPoints: nil,
            postText: "Esse eu occaecat id. Tempor voluptate dolor id cupidatat nulla ea adipisicing in exercitation. Nisi amet occaecat laboris id sit esse commodo laborum nisi pariatur sit. Ullamco in nostrud irure ad anim non esse minim. Dolor tempor magna mollit et tempor laborum nostrud dolore ipsum. Laborum non irure nulla reprehenderit ipsum eu pariatur proident ipsum non proident tempor. Excepteur ipsum aliquip consequat adipisicing sit.",

            likesCount: 23_234,
            commentsCount: 12,
            isLiked: isLiked,
            isSharable: true,
            isPinned: true,
            likesByImages: [
              "https://picsum.photos/400",
              "https://picsum.photos/450",
              "https://picsum.photos/500"
            ],
            likesByText: "aimé par 21 personnes", didTap: {
            }, didTapUserName: {
            }, didTapUserTeam: {
            }, didTapSenderMore: {
            }, didTapLike: {
              print("is liked tapped")
              isLiked.toggle()
            }, didTapComment: {
              isCommentSheetPresented = true
            }, didTapNewComment: {},
            didTapShare: {
            }, didTapLikesBy: {
            }
          )

          SocialWallPostView(
            userImage: "https://picsum.photos/100",
            senderImage: "https://picsum.photos/200",
            senderName: "Romane Pierre",
            senderTeam: "Élégant Frais Frites",
            createdAt: Date(timeIntervalSince1970: 1701773464),
            isMoreActionVisible: true,
            postImage: "https://picsum.photos/650",
            postTagName: "#TagName",
            postTagPoints: "1 230Pts",
            postText: "Esse eu occaecat id. Tempor voluptate dolor id cupidatat nulla ea adipisicing in exercitation. Nisi amet occaecat laboris id sit esse commodo laborum nisi pariatur sit. Ullamco in nostrud irure ad anim non esse minim. Dolor tempor magna mollit et tempor laborum nostrud dolore ipsum. Laborum non irure nulla reprehenderit ipsum eu pariatur proident ipsum non proident tempor. Excepteur ipsum aliquip consequat adipisicing sit.",

            likesCount: 21,
            commentsCount: 12,
            isLiked: isLiked2,
            isSharable: true,
            isPinned: true,
            likesByImages: [
              "https://picsum.photos/400",
              "https://picsum.photos/450",
              "https://picsum.photos/500"
            ],
            likesByText: "aimé par 21 personnes", didTap: {
            }, didTapUserName: {
            }, didTapUserTeam: {
            }, didTapSenderMore: {
            }, didTapLike: {
              isLiked2.toggle()
            }, didTapComment: {
            }, didTapNewComment: {},
            didTapShare: {},
            didTapLikesBy: {}
          )

          SocialWallPostView(
            userImage: "https://picsum.photos/100",
            senderImage: "https://picsum.photos/200",
            senderName: "Romane Pierre",
            senderTeam: "Élégant Frais Frites",
            createdAt: Date(timeIntervalSince1970: 1701773464),
            isMoreActionVisible: true,
            postImage: "https://picsum.photos/700",
            postTagName: "#TagName",
            postTagPoints: "1 230Pts",
            postText: "Esse eu occaecat id. Tempor voluptate dolor id cupidatat nulla ea adipisicing in exercitation. Nisi amet occaecat laboris id sit esse commodo laborum nisi pariatur sit. Ullamco in nostrud irure ad anim non esse minim. Dolor tempor magna mollit et tempor laborum nostrud dolore ipsum. Laborum non irure nulla reprehenderit ipsum eu pariatur proident ipsum non proident tempor. Excepteur ipsum aliquip consequat adipisicing sit.",

            likesCount: 21,
            commentsCount: 12,
            isLiked: isLiked2,
            isSharable: true,
            isPinned: true,
            likesByImages: [
              "https://picsum.photos/400",
              "https://picsum.photos/450",
              "https://picsum.photos/500"
            ],
            likesByText: "aimé par 21 personnes", didTap: {
            }, didTapUserName: {
            }, didTapUserTeam: {
            }, didTapSenderMore: {
            }, didTapLike: {
              isLiked2.toggle()
            }, didTapComment: {},
            didTapNewComment: {},
            didTapShare: {},
            didTapLikesBy: {}
          )

          SocialWallPostView(
            userImage: "https://picsum.photos/100",
            senderImage: "https://picsum.photos/200",
            senderName: "Romane Pierre",
            senderTeam: "Élégant Frais Frites",
            createdAt: Date(timeIntervalSince1970: 1701773464),
            isMoreActionVisible: true,
            postImage: "https://picsum.photos/800",
            postTagName: "#TagName",
            postTagPoints: "1 230Pts",
            postText: "Esse eu occaecat id. Tempor voluptate dolor id cupidatat nulla ea adipisicing in exercitation. Nisi amet occaecat laboris id sit esse commodo laborum nisi pariatur sit. Ullamco in nostrud irure ad anim non esse minim. Dolor tempor magna mollit et tempor laborum nostrud dolore ipsum. Laborum non irure nulla reprehenderit ipsum eu pariatur proident ipsum non proident tempor. Excepteur ipsum aliquip consequat adipisicing sit.",

            likesCount: 21,
            commentsCount: 12,
            isLiked: isLiked2,
            isSharable: true,
            isPinned: true,
            likesByImages: [
              "https://picsum.photos/400",
              "https://picsum.photos/450",
              "https://picsum.photos/500"
            ],
            likesByText: "aimé par 21 personnes", didTap: {
            }, didTapUserName: {
            }, didTapUserTeam: {
            }, didTapSenderMore: {
            }, didTapLike: {
              isLiked2.toggle()
            }, didTapComment: {},
            didTapNewComment: {},
            didTapShare: {},
            didTapLikesBy: {}
          )
        })

    }
    .listStyle(.grouped)
    .listBackgroundColor(.bones(.AQILevel2))
    .listRowSpacing(16)
    .sheet(isPresented: $isCommentSheetPresented, content: {
      NavigationView {
        Preview_SocialCommentView()
          .navigationTitle("comments")
          .navigationBarTitleDisplayMode(.inline)
      }
      .presentationDetents([.medium, .large])
      .presentationDragIndicator(.visible)
    })
  }
}

#Preview {
  Preview_SocialWallPostView()
}
