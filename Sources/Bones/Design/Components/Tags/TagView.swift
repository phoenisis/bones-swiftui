//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 20/10/2023.
//

import SwiftUI

/// A view representing a tag, possibly containing an icon and customizable styles.
///
/// ```
/// # Example usage:
/// ```
/// TagView("Placeholder", icon: nil, style: .primary)
/// ```
public struct TagView: View {
  /// Enumerates the styles a tag can adopt.
  public enum TagStyle: String, Identifiable, CaseIterable {
    case `default`
    case white
    case primary

    public var id: String { rawValue }
  }

  let tagName: String?
  let icon: BonesIconToken?
  let iconUrl: String?
  let style: TagStyle

  /// The background color based on the tag style.
  var backgroundColor: Color {
    switch style {
      case .default:
          .bones.white
      case .white:
          .bones.white
      case .primary:
          .bones.primary
    }
  }

  /// The foreground color based on the tag style.
  var foregroundColor: Color {
    switch style {
      case .default:
          .bones.textDark
      case .white:
          .bones.textDark
      case .primary:
          .bones.primaryForeground
    }
  }

  /// The foreground color based on the tag style.
  var borderColor: Color {
    switch style {
      case .default:
          .bones.textDark
      case .white:
          .bones.white
      case .primary:
          .bones.primary
    }
  }

  var radius: CGFloat.BonesRadius {
    switch style {
      case .default:
          .large
      case .white:
          .small
      case .primary:
          .small
    }
  }

  /// Creates a new tag view.
  /// - Parameters:
  ///   - tagName: The name displayed in the tag.
  ///   - icon: An optional icon displayed within the tag.
  ///   - style: The style applied to the tag.
  public init(_ tagName: String?, icon: BonesIconToken?, iconUrl: String? = nil, style: TagStyle) {
    self.tagName = tagName.localized
    self.icon = icon
    self.iconUrl = iconUrl
    self.style = style
  }

  public var body: some View {
    if let tagName {
      HStack(
        alignment: .center,
        spacing: .bones(.small),
        content: {
          if let icon {
            BonesIcon(
              icon: .bones(icon),
              fontWeight: .medium,
              renderingMode: .template
            )
            .frame(width: 16, height: 16)
          }
          if let iconUrl {
            CachedAsyncImage(url: URL(string: iconUrl),
                             transaction: .init(animation: .easeInOut(duration: 0.6))) {
              phase in
              ZStack {
                Color.clear
                switch phase {
                  case .success(let image):
                    image
                      .resizable()
                      .frame(width: 16, height: 16)
                      .aspectRatio(contentMode: .fill)
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
              .frame(width: 16, height: 16)
            }
          }
          Text(tagName)
            .font(.custom(.bones(.small)))
        }
      )
      .padding(.vertical, .bones(.small))
      .padding(.horizontal, .bones(.medium))
      .background(
        RoundedRectangle(bonesRadius: .bones(radius), style: .continuous)
          .fill(backgroundColor)
          .overlay(content: {
            RoundedRectangle(bonesRadius: .bones(radius), style: .continuous)
              .stroke(lineWidth: 1)
              .foregroundStyle(borderColor)
          })
      )
      .foregroundStyle(foregroundColor)
    } else {
      EmptyView()
    }
  }
}

/// A preview of the `TagView`.
struct Preview_TagView: View {
  var body: some View {
    List {
      Section {
        ForEach(TagView.TagStyle.allCases) { style in
          TagView("Placeholder", icon: nil, style: style)
        }
      } header: {
        Text("Default")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        ForEach(TagView.TagStyle.allCases) { style in
          TagView("Placeholder", icon: .camera, style: style)
        }
      } header: {
        Text("With icon")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        ForEach(TagView.TagStyle.allCases) { style in
          TagView("Placeholder", icon: nil, iconUrl: "https://picsum.photos/209", style: style)
        }
      } header: {
        Text("With icon distant")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_TagView()
}
