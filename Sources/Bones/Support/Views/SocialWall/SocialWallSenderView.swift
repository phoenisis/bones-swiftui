//
//  SocialWallSenderView.swift
//
//
//  Created by Quentin PIDOUX on 20/10/2023.
//

import SwiftUI

/// A view component that displays information of a user who has posted on a social wall.
///
/// This structure provides a view that is used to display the sender's information including image, name, and team,
/// along with interaction handlers such as tap actions for the user, team, and more options.
public struct SocialWallSenderView: View {
  let imageUrl: String?
  let userName: String
  let userTeam: String?
  let createdAt: Date

  let isMoreVisible: Bool
  let isInlineLayout: Bool

  let userTapped: () -> Void
  let userTeamTapped: () -> Void
  let moreTapped: () -> Void

  /// Initializes a new `SocialWallSenderView`.
  ///
  /// - Parameters:
  ///   - imageUrl: An optional string containing the URL of the user's image.
  ///   - userName: A string containing the name of the user.
  ///   - userTeam: An optional string containing the team of the user.
  ///   - createAt: An optional string containing the creation date and time.
  ///   - isMoreVisible: A boolean that determines whether the more options button is visible. Default is true.
  ///   - userTapped: An action to perform when the user is tapped.
  ///   - userTeamTapped: An action to perform when the team is tapped.
  ///   - moreTapped: An action to perform when the more options button is tapped.

  public init(
    imageUrl: String?,
    userName: String,
    userTeam: String?,
    createdAt: Date,
    isMoreVisible: Bool = true,
    isInlineLayout: Bool = false,
    userTapped: @escaping () -> Void,
    userTeamTapped: @escaping () -> Void,
    moreTapped: @escaping () -> Void
  ) {
    self.imageUrl = imageUrl
    self.userName = userName
    self.userTeam = userTeam
    self.createdAt = createdAt
    self.isMoreVisible = isMoreVisible
    self.isInlineLayout = isInlineLayout
    self.userTapped = userTapped
    self.userTeamTapped = userTeamTapped
    self.moreTapped = moreTapped
  }

  /// The body of the `SocialWallSenderView`.
  ///
  /// This provides the content and behavior for the view.
  public var body: some View {
    VStack(
      alignment: .leading,
      spacing: .bones(.medium),
      content: {
        user

        HStack(alignment: .center, content: {
          if let userTeam {
            Button(action: {
              userTeamTapped()
            }, label: {
              Text(userTeam)
                .font(.custom(.bones(.smallBold)))
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            })
          }
          if isInlineLayout == false {
            Text(createdAt, formatter: RelativeDateTimeFormatter())
              .font(.custom(.bones(.smallBold)))
              .foregroundStyle(Color.bones.grey4)
          }
        })
      }
    )
    .foregroundStyle(Color.bones.textDark)
    .frame(maxWidth: .infinity, alignment: .leading)
    .minimumScaleFactor(0.99)
    .dynamicTypeSize(.xSmall ... .accessibility3)
  }

  @ViewBuilder var user: some View {
    HStack(
      alignment: .center,
      spacing: .bones(.medium),
      content: {
        Button(action: {
          userTapped()
        }, label: {
          BonesAvatarView(
            size: .large,
            avatarType: .user,
            imageUrl: imageUrl
          )
        })

        Button(action: {
          userTapped()
        }, label: {
          Text(userName)
            .font(.custom(.bones(.bodyBold)))
        })
        .buttonStyle(.bones(.defaultText(1)))
        .frame(maxWidth: .infinity, alignment: .leading)

        if isInlineLayout {
          Text(createdAt, formatter: RelativeDateTimeFormatter())
            .font(.custom(.bones(.smallBold)))
            .foregroundStyle(Color.bones.grey4)
        }
        if isMoreVisible {
          Button(action: {
            moreTapped()
          }, label: {
            BonesIcon(icon: .bones(.more), renderingMode: .template)
              .frame(width: 16, height: 16)
          })
        }
      }
    )
  }
}

struct Preview_SocialWallSenderView: View {
  var body: some View {
    List {
      SocialWallSenderView(
        imageUrl: "https://picsum.photos/500",
        userName: "Kelvin Rodriguez",
        userTeam: "Générique Bois Voiture", 
        createdAt: Date(timeIntervalSinceNow: -4)
      ) {
        print("user tapped")
      } userTeamTapped: {
        print("user team tapped")
      } moreTapped: {
        print("more tapped")
      }

      SocialWallSenderView(
        imageUrl: "https://picsum.photos/550",
        userName: "Herluin Jacquet",
        userTeam: "Moderne Doux Saucisses",
        createdAt: Date(timeIntervalSince1970: 1701774464)
      ) {
        print("user tapped")
      } userTeamTapped: {
        print("user team tapped")
      } moreTapped: {
        print("more tapped")
      }

      SocialWallSenderView(
        imageUrl: nil,
        userName: "Herluin Jacquet",
        userTeam: nil,
        createdAt: Date(timeIntervalSince1970: 1701774464)
      ) {
        print("user tapped")
      } userTeamTapped: {
        print("user team tapped")
      } moreTapped: {
        print("more tapped")
      }

      SocialWallSenderView(
        imageUrl: nil,
        userName: "Herluin Jacquet",
        userTeam: nil,
        createdAt: Date(timeIntervalSince1970: 1701774464)
      ) {
        print("user tapped")
      } userTeamTapped: {
        print("user team tapped")
      } moreTapped: {
        print("more tapped")
      }

      SocialWallSenderView(
        imageUrl: nil,
        userName: "Herluin Jacquet",
        userTeam: nil,
        createdAt: Date(timeIntervalSince1970: 1701774464),
        isMoreVisible: false
      ) {
        print("user tapped")
      } userTeamTapped: {
        print("user team tapped")
      } moreTapped: {
        print("more tapped")
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_SocialWallSenderView()
}
