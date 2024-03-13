//
//  AvatarGroupView.swift
//  
//
//  Created by Quentin PIDOUX on 19/10/2023.
//

import SwiftUI

/// `AvatarGroupView`
/// A SwiftUI view that displays a horizontal group of avatar images with overlapping visuals.
///
/// This view is ideal for representing multiple users in a compact space, such as user group icons.
public struct AvatarGroupView: View {

  /// `AvatarItem`
  /// A structure representing the data model for an avatar, including identification and image URL.
  struct AvatarItem: Identifiable {
    let id: String
    let imageUrl: String
  }

  let size: BonesAvatarView.Size
  let type: BonesAvatarView.AvatarType
  let images: [AvatarItem]

  /// Computed property that determines the spacing between avatar images.
  var spacing: CGFloat { 
    presented ? (size.rawValue/1.5) * -1 : -size.rawValue
//    -size.rawValue
//    (size.rawValue/1.5) * -1
  }
  @State var presented: Bool = true

  /// Initializes a new avatar group view with specified size, type, and images.
  ///
  /// - Parameters:
  ///   - size: The display size of each avatar.
  ///   - type: The type of avatar, determining its visual style.
  ///   - images: An array of image URLs represented as strings.
  public init(size: BonesAvatarView.Size, type: BonesAvatarView.AvatarType, images: [String?]) {
    self.size = size
    self.type = type
    self.images = images
      .compactMap {$0 }
      .reversed()
      .prefix(3)
      .map { AvatarItem(id: $0, imageUrl: $0) }
  }

  func getDegreeForOffset(_ offset: Int) -> Double {
    switch offset {
      case 0: presented ? Double(-((offset+1)*8)) : 0
      case 1: 0
      default: presented ? Double((offset+1)*4) : 0
    }
  }

  func getOffsetForOffset(_ offset: Int) -> CGFloat {
    presented ? CGFloat(CGFloat(offset)*(size.rawValue/2)) : 0
  }

  var maxHeight: CGFloat {
    CGFloat(CGFloat(images.count)*(size.rawValue/1.5))
  }

  var maxWidth: CGFloat {
    CGFloat(CGFloat(images.count)*(size.rawValue/1.5))
  }

  /// The body property that constructs the view hierarchy for the avatar group view.
  public var body: some View {
    HStack(
      alignment: .center,
      spacing: spacing,
      content: {
        ForEach(Array(images.enumerated()), id: \.offset) { offset, image in
          BonesAvatarView(
            size: size,
            avatarType: type,
            imageUrl: image.imageUrl
          )
          .padding(.bottom, getOffsetForOffset(offset))
          .rotationEffect(.degrees(getDegreeForOffset(offset)), anchor: .center)
          .transition(
            .offset(
              x: getOffsetForOffset(offset)
            )
          )
        }
      }
    )
    .animation(.easeIn, value: presented)
    .frame(width: maxWidth, height: maxHeight)
    .onAppear { presented = true }
  }
}

/// `Preview_AvatarGroupView`
/// A preview provider that helps visualize the appearance of `AvatarGroupView` within the canvas during design time.
struct Preview_AvatarGroupView: View {
  var body: some View {
    List {
      ForEach(BonesAvatarView.Size.allCases) { size in
        AvatarGroupView(
          size: size,
          type: .user,
          images: [
            "https://picsum.photos/200",
            "https://picsum.photos/300",
            "https://picsum.photos/400",
            "https://picsum.photos/500",
          ]
        )
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_AvatarGroupView()
}
