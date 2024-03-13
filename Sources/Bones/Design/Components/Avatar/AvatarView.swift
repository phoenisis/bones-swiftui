import SwiftUI

/// A view representing a user's avatar.
struct BonesUserAvatarView: View {
  /// The URL of the user's avatar image.
  let imageUrl: String?
  /// The Data of the image
  let data: Data?
  /// The size of the avatar.
  let size: BonesAvatarView.Size

  let isFill: Bool

  var body: some View {
    if let imageUrl {
      /// Displays the user's image from the provided URL.
      CachedAsyncImage(url: URL(string: imageUrl),
                       transaction: .init(animation: .easeInOut(duration: 0.6))) {
        phase in
        ZStack {
          Color.bones.white
          switch phase {
            case .success(let image):
              image
                .resizable()
                .aspectRatio(contentMode: isFill ? .fill : .fit)
                .zIndex(1)
                .transition(.movingParts.snapshot)
            case .failure(let error):
              Text(error.localizedDescription)
                .font(.caption)
            case .empty:
              EmptyView()
            @unknown default:
              EmptyView()
          }
        }
        .frame(width: size.rawValue, height: size.rawValue)
        .aspectRatio(contentMode: .fill)
        .clipShape(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
      }
    } else if let data,
              let image = UIImage(data: data) {
      /// Default user icon displayed when no image URL is provided.
      Image(uiImage: image)
        .resizable()
        .frame(width: size.rawValue, height: size.rawValue)
        .clipShape(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        )
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium))
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
    } else {
      /// Default user icon displayed when no image URL is provided.
      BonesIcon(icon: .bones(.user), renderingMode: .template)
        .frame(width: size.rawValue-16, height: size.rawValue-16)
        .foregroundStyle(Color.bones.grey4)
        .frame(width: size.rawValue, height: size.rawValue)
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
    }
  }
}

/// A view representing a user's avatar.
struct BonesUserDeletedAvatarView: View {
  /// The URL of the user's avatar image.
  let imageUrl: String?
  /// The Data of the image
  let data: Data?
  /// The size of the avatar.
  let size: BonesAvatarView.Size

  let isFill: Bool

  var body: some View {
    if let imageUrl {
      /// Displays the user's image from the provided URL.
      CachedAsyncImage(url: URL(string: imageUrl),
                       transaction: .init(animation: .easeInOut(duration: 0.6))) {
        phase in
        ZStack {
          Color.bones.white
          switch phase {
            case .success(let image):
              image
                .resizable()
                .aspectRatio(contentMode: isFill ? .fill : .fit)
                .zIndex(1)
                .transition(.movingParts.snapshot)
            case .failure(let error):
              Text(error.localizedDescription)
                .font(.caption)
            case .empty:
              EmptyView()
            @unknown default:
              EmptyView()
          }
        }
        .frame(width: size.rawValue, height: size.rawValue)
        .aspectRatio(contentMode: .fill)
        .clipShape(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
      }
    } else if let data,
              let image = UIImage(data: data) {
      /// Default user icon displayed when no image URL is provided.
      Image(uiImage: image)
        .resizable()
        .frame(width: size.rawValue, height: size.rawValue)
        .clipShape(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        )
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium))
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
    } else {
      /// Default user icon displayed when no image URL is provided.
      BonesIcon(icon: .bones(.userSlash), renderingMode: .template)
        .frame(width: size.rawValue-16, height: size.rawValue-16)
        .foregroundStyle(Color.bones.grey4)
        .frame(width: size.rawValue, height: size.rawValue)
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
    }
  }
}
/// A view representing a team's avatar.
struct BonesTeamAvatarView: View {
  /// The URL of the team's avatar image.
  let imageUrl: String?
  /// The Data of the image
  let data: Data?
  /// The size of the avatar.
  let size: BonesAvatarView.Size

  let isFill: Bool

  var body: some View {
    if let imageUrl {
      CachedAsyncImage(url: URL(string: imageUrl),
                       transaction: .init(animation: .easeInOut(duration: 0.6))) {
        phase in
        ZStack {
          Color.bones.white
          switch phase {
            case .success(let image):
              image
                .resizable()
                .aspectRatio(contentMode: isFill ? .fill : .fit)
                .zIndex(1)
                .transition(.movingParts.snapshot)
            case .failure(let error):
              Text(error.localizedDescription)
                .font(.caption)
            case .empty:
              EmptyView()
            @unknown default:
              EmptyView()
          }
        }
        .frame(width: size.rawValue, height: size.rawValue)
        .aspectRatio(contentMode: .fill)
        .clipShape(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
      }
    } else if let data,
              let image = UIImage(data: data) {
      /// Default user icon displayed when no image URL is provided.
      Image(uiImage: image)
        .resizable()
        .transition(.movingParts.filmExposure)
        .frame(width: size.rawValue, height: size.rawValue)
        .clipShape(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        )
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium))
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
    } else {
      /// Default team icon displayed when no image URL is provided.
      BonesIcon(icon: .bones(.team), renderingMode: .template)
        .frame(width: size.rawValue-16, height: size.rawValue-16)
        .foregroundStyle(Color.bones.grey4)
        .frame(width: size.rawValue, height: size.rawValue)
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
    }
  }
}

/// A view representing a team's avatar.
struct BonesNoneAvatarView: View {
  /// The URL of the team's avatar image.
  let imageUrl: String?
  /// The Data of the image
  let data: Data?
  /// The size of the avatar.
  let size: BonesAvatarView.Size

  let isFill: Bool

  var body: some View {
    if let imageUrl {
      /// Displays the team's image from the provided URL.
      CachedAsyncImage(url: URL(string: imageUrl),
                       transaction: .init(animation: .easeInOut(duration: 0.6))) {
        phase in
        ZStack {
          Color.bones.white
          switch phase {
            case .success(let image):
              image
                .resizable()
                .aspectRatio(contentMode: isFill ? .fill : .fit)
                .zIndex(1)
                .transition(.movingParts.snapshot)
            case .failure(let error):
              Text(error.localizedDescription)
                .font(.caption)
            case .empty:
              EmptyView()
            @unknown default:
              EmptyView()
          }
        }
        .frame(width: size.rawValue, height: size.rawValue)
        .aspectRatio(contentMode: .fill)
        .clipShape(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
      }
    }  else if let data,
               let image = UIImage(data: data) {
      /// Default user icon displayed when no image URL is provided.
      Image(uiImage: image)
        .resizable()
        .frame(width: size.rawValue, height: size.rawValue)
        .transition(.movingParts.filmExposure)
        .clipShape(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        )
        .background(
          RoundedRectangle(bonesRadius: .bones(.medium))
            .fill(Color.bones.grey3)
            .overlay(
              RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                .stroke(Color.bones.white, lineWidth: 2)
            )
        )
    } else {
      EmptyView()
    }
  }
}

/// A generic avatar view that can represent either a user or a team.
public struct BonesAvatarView: View {

  /// Enum representing available avatar sizes.
  public enum Size: CGFloat, CaseIterable, Identifiable {
    case small = 16
    case medium = 24
    case large = 32
    case xLarge = 64
    case teamMember = 72
    case xxLarge = 128

    public var id: String {
      switch self {
        case .small: return "small"
        case .medium: return "medium"
        case .large: return "large"
        case .xLarge: return "xLarge"
        case .teamMember: return "teamMember"
        case .xxLarge: return "xxLarge"
      }
    }
  }

  /// Enum representing avatar types (user or team).
  public enum AvatarType: String, CaseIterable, Identifiable {
    case user
    case userDeleted
    case team
    case none

    public var id: String { self.rawValue }
  }

  let size: Size
  let avatarType: AvatarType
  let imageUrl: String?
  let data: Data?
  let isFill: Bool

  /// Creates an instance of `BonesAvatarView`.
  public init(size: Size, avatarType: AvatarType, imageUrl: String?, data: Data?, isFill: Bool = true) {
    self.size = size
    self.avatarType = avatarType
    self.data = data
    self.imageUrl = imageUrl
    self.isFill = isFill
  }

  public init(size: Size, avatarType: AvatarType, imageUrl: String?, isFill: Bool = true) {
    self.size = size
    self.avatarType = avatarType
    self.data = nil
    self.imageUrl = imageUrl
    self.isFill = isFill
  }

  public var body: some View {
    switch avatarType {
      case .user:
        BonesUserAvatarView(imageUrl: imageUrl, data: data, size: size, isFill: isFill)
      case .userDeleted:
        BonesUserDeletedAvatarView(imageUrl: imageUrl, data: data, size: size, isFill: isFill)
      case .team:
        BonesTeamAvatarView(imageUrl: imageUrl, data: data, size: size, isFill: isFill)
      case .none:
        BonesNoneAvatarView(imageUrl: imageUrl, data: data, size: size, isFill: isFill)
    }
  }
}

struct Preview_BonesAvatarView: View {
  var body: some View {
    List {
      ForEach(BonesAvatarView.AvatarType.allCases) { type in
        Section {
          ForEach(BonesAvatarView.Size.allCases) { size in
            HStack {
              Text(size.id)
                .font(.bones(.body))
              Spacer()
              HStack(alignment: .center) {
                BonesAvatarView(size: size, avatarType: type, imageUrl: nil)
                BonesAvatarView(size: size, avatarType: type, imageUrl: "https://picsum.photos/304")
              }
            }
          }
        } header: {
          Text(type.id)
            .font(.custom(.bones(.bodyBold)))
            .foregroundStyle(Color.bones.textDark)
        }
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_BonesAvatarView()
}
