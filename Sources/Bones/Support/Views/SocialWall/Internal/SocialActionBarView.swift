//
//  SocialActionBarView.swift
//
//
//  Created by Quentin PIDOUX on 16/10/2023.
//

import SwiftUI

/// A view that presents a social action bar, including like, comment, share, and pin actions.
///
/// A `SocialActionBarView` is a horizontal grid of action buttons including like, comment, share, and pin.
/// Each action comes with a specific icon and action handler.
struct SocialActionBarView: View {
  private let columnGrid = [
    GridItem(.fixed(60)),
    GridItem(.fixed(60))
  ]

  let isLiked: Bool
  let isPinned: Bool
  let isSharable: Bool
  let likeCount: Int
  let commentCount: Int
  let points: String?

  let likedTapped: () -> Void
  let commentTapped: () -> Void
  let seeLikedTapped: () -> Void
  let shareTapped: (() -> Void)?

  /// Creates a social action bar view with provided configurations.
  ///
  /// - Parameters:
  ///   - isLiked: A boolean indicating whether the content is liked.
  ///   - likeCount: The total count of likes.
  ///   - commentCount: The total count of comments.
  ///   - isSharable: A boolean indicating whether the content is sharable.
  ///   - isPinned: A boolean indicating whether the content is pinned.
  ///   - likedTapped: A closure executed when the like action is tapped.
  ///   - shareTapped: An optional closure executed when the share action is tapped.
  init(isLiked: Bool, likeCount: Int, commentCount: Int, points: String?, isSharable: Bool, isPinned: Bool, likedTapped: @escaping () -> Void, commentTapped: @escaping () -> Void, seeLikedTapped: @escaping () -> Void, shareTapped: (() -> Void)? = nil) {
    self.isLiked = isLiked
    self.isPinned = isPinned
    self.isSharable = isSharable
    self.likedTapped = likedTapped
    self.shareTapped = shareTapped
    self.likeCount = likeCount
    self.seeLikedTapped = seeLikedTapped
    self.commentTapped = commentTapped
    self.commentCount = commentCount
    self.points = points
  }

  /// The body composed of a grid of action buttons.
  public var body: some View {
    VStack(
      alignment: .leading,
      spacing: .bones(.medium),
      content: {
        HStack(alignment: .center, spacing: nil, content: {
          HStack(
            alignment: .center,
            spacing: .bones(.large),
            content: {
              Button(
                action: {
                  likedTapped()
                  HapticsProvider.sendHapticFeedback(.light())
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

                    if likeCount > 0 {
                      Text(likeCount, format: .number.notation(.compactName).grouping(.automatic))
                        .lineLimit(1)
                    }
                  }
                })
                .animation(.default, value: isLiked)

              Button(
                action: {
                  commentTapped()
                  HapticsProvider.sendHapticFeedback(.light())
                }, label: {
                  HStack(alignment: .center) {
                    BonesIcon(icon: .bones(.comment), renderingMode: .template)
                      .frame(width: 20, height: 20)
                    if commentCount > 0 {
                      Text(commentCount, format: .number.notation(.compactName).grouping(.automatic))
                        .lineLimit(1)
                    }
                  }
                }
              )
            }
          )
          Spacer()
          if self.isSharable {
            Button(action: {
              shareTapped?()
              HapticsProvider.sendHapticFeedback(.light())
            }, label: {
              BonesIcon(icon: .bones(.share), renderingMode: .template)
                .frame(width: 20, height: 20)
            })
          }
        })
        .frame(maxWidth: .infinity)

        if likeCount > 0 {
          Button(action: { seeLikedTapped() }, label: {
            Text("SOCIAL_SEE_LIKES_BUTTON")
              .font(.custom(.bones(.smallBold)))
              .padding(.bottom, .bones(.small))
          })
        }
      }
    )
    .animation(.default, value: likeCount)
    .font(.custom(.bones(.small)))
    .foregroundStyle(Color.bones.textDark)
    .dynamicTypeSize(.xSmall ... .accessibility1)
  }
}

/// A preview struct for visualizing `SocialActionBarView` in SwiftUI previews.
struct Preview_SocialActionBarView: View {
  @State var isLiked1: Bool = true
  @State var isLiked2: Bool = false
  @State var isLiked3: Bool = false
  @State var isLiked4: Bool = false

  /// The body composed of a list of `SocialActionBarView` samples.
  var body: some View {
    List {
      SocialActionBarView(
        isLiked: isLiked1,
        likeCount: 12,
        commentCount: 23,
        points: "5 pts",
        isSharable: true,
        isPinned: true
      ) { isLiked1.toggle()
        print("like")
      } commentTapped: {}
        seeLikedTapped: {}
        shareTapped: {
          print("share")
        }
      SocialActionBarView(
        isLiked: isLiked2,
        likeCount: 422,
        commentCount: 3,
        points: "5 pts",
        isSharable: true,
        isPinned: false
      ) { isLiked2.toggle() }
        commentTapped: {}
        seeLikedTapped: { }
      SocialActionBarView(
        isLiked: isLiked3,
        likeCount: 12_523,
        commentCount: 5_344,
        points: "5 pts",
        isSharable: false,
        isPinned: true
      ) { isLiked3.toggle() }
        commentTapped: {}
        seeLikedTapped: { }
      SocialActionBarView(
        isLiked: isLiked4,
        likeCount: 0,
        commentCount: 0,
        points: nil,
        isSharable: false,
        isPinned: false
      ) { isLiked4.toggle() }
        commentTapped: {}
        seeLikedTapped: { }
    }
    .listBackgroundColor()
    .listStyle(.grouped)
  }
}

#Preview {
  Preview_SocialActionBarView()
}
