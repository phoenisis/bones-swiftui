//
//  SocialWallLikesByView.swift
//
//
//  Created by Quentin PIDOUX on 31/10/2023.
//

import SwiftUI

/// A SwiftUI view representing a social wall with likes by view feature.
///
/// This view displays a row of avatar images and a text to indicate interaction with a social media post.
/// A button action is attached to the entire row.
///
/// # Example
///
/// ```
/// SocialWallLikesByView(
///   images: ["https://picsum.photos/200", "https://picsum.photos/300"],
///   text: "2 Likes",
///   imageLimites: 3
/// ) {
///   print("Tapped")
/// }
/// ```
///
/// - Author: Quentin PIDOUX
public struct SocialWallLikesByView: View {
  /// An array of URLs for the avatar images.
  let images : [String]
  /// The text description.
  let text   : String
  /// The action to execute when the button is tapped.
  let didTap : () -> Void

  /// Creates a new `SocialWallLikesByView`.
  ///
  /// - Parameters:
  ///   - images: An array of URLs for the avatar images.
  ///   - text: The text description to display next to the avatars.
  ///   - imageLimites: The maximum number of avatar images to display. Default is 3.
  ///   - didTap: The action to execute when the button is tapped.
  public init(
    images       : [String],
    text         : String,
    imageLimites : Int = 3,
    didTap       : @escaping () -> Void
  ) {
    self.images = Array(images.prefix(imageLimites))
    self.text   = text
    self.didTap = didTap
  }

  public var body: some View {
    Button(action: {
      Haptic.feedback(.light)
      didTap()
    }, label: {
      HStack(
        alignment: .center,
        spacing: .bones(.medium),
        content: {
          AvatarGroupView(size: .medium, type: .user, images: images)
          Text(text)
            .font(.custom(.bones(.small)))
        }
      )
      .frame(maxWidth: .infinity, alignment: .leading)
      .foregroundStyle(Color.bones.textDark)
    })
  }
}

// MARK: - Preview

/// A preview view for `SocialWallLikesByView`.
struct Preview_SocialWallLikesBy: View {
  var body: some View {
    List {
      SocialWallLikesByView(
        images: [
          "https://picsum.photos/200",
          "https://picsum.photos/300",
          "https://picsum.photos/400",
          "https://picsum.photos/500",
        ],
        text: "Veniam velit aliquip culpa non excepteur sit et cupidatat.",
        imageLimites: 3
      ) {}

      SocialWallLikesByView(
        images: [
          "https://picsum.photos/200",
          "https://picsum.photos/300"
        ],
        text: "Minim consequat cupidatat sunt ex consequat consequat elit irure ea ea.",
        imageLimites: 3
      ) {}

      SocialWallLikesByView(
        images: [
          "https://picsum.photos/200"
        ],
        text: "Et eiusmod velit laborum ullamco reprehenderit.",
        imageLimites: 3
      ) {}

      SocialWallLikesByView(
        images: [],
        text: "Aute commodo consectetur commodo consequat exercitation reprehenderit ad magna consectetur duis nisi sunt ad consequat ad.",
        imageLimites: 3
      ) {}

      SocialWallLikesByView(
        images: [
          "https://picsum.photos/200",
          "https://picsum.photos/300",
          "https://picsum.photos/400",
          "https://picsum.photos/500",
        ],
        text: "Quis ipsum deserunt minim amet sunt enim reprehenderit laboris consectetur ad cillum. Non laboris ad anim deserunt velit aliqua. Ullamco ullamco adipisicing aliquip anim ullamco. Lorem exercitation ea nisi sint.",
        imageLimites: 3
      ) {}
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_SocialWallLikesBy()
}
