//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import SwiftUI

extension Image {
  /// Initializes an Image with a symbol representing the specified `BonesIconStyle`.
  ///
  /// - Parameter type: A `BonesIconStyle` value representing the icon style to use.
	public init(_ type: BonesIconStyle) {
		switch type {
			case .bones(let style):
				switch style {
					case .play:
						self.init(systemName: "play.fill")
					case .pause:
						self.init(systemName: "pause.fill")
					case .finish:
						self.init(systemName: "flag.checkered")
					case .chevronRight:
						self.init(systemName: "chevron.right")
					case .chevronLeft:
						self.init(systemName: "chevron.left")
					case .chevronUp:
						self.init(systemName: "chevron.up")
					case .chevronDown:
						self.init(systemName: "chevron.down")
          case .chevronDownCompact:
            self.init(systemName: "chevron.compact.down")
					case .add:
						self.init(systemName: "plus")
					case .close:
						self.init(systemName: "xmark")
					case .search:
						self.init(systemName: "magnifyingglass")
					case .filter:
						self.init(systemName: "line.3.horizontal.decrease.circle")
					case .filterFill:
						self.init(systemName: "line.3.horizontal.decrease.circle.fill")
					case .passwordOn:
						self.init(systemName: "eye.slash")
					case .passwordOff:
						self.init(systemName: "eye")
					case .user:
						self.init(systemName: "person")
          case .userSlash:
            self.init(systemName: "person.slash")
					case .team:
						self.init(systemName: "person.2")
					case .like:
						self.init(systemName: "heart")
					case .likeFill:
						self.init(systemName: "heart.fill")
					case .comment:
						self.init(systemName: "bubble")
					case .share:
						self.init(systemName: "square.and.arrow.up")
					case .bookmark:
						self.init(systemName: "bookmark")
					case .bookmarkFill:
						self.init(systemName: "bookmark.fill")
					case .checkmark:
						self.init(systemName: "checkmark")
					case .more:
						self.init(systemName: "ellipsis")
					case .settings:
						self.init(systemName: "gearshape.fill")
					case .camera:
						self.init(systemName: "camera.fill")
					case .photoLibrary:
						self.init(systemName: "photo.fill.on.rectangle.fill")
					case .reset:
						self.init(systemName: "arrow.counterclockwise")
					case .send:
						self.init(systemName: "paperplane.fill")
					case .star:
						self.init(systemName: "star")
					case .starFill:
						self.init(systemName: "star.fill")
					case .future:
						self.init(systemName: "hourglass")
					case .past:
						self.init(systemName: "clock.arrow.circlepath")
					case .durationUndetermined:
						self.init(systemName: "clock.arrow.2.circlepath")
					case .lock:
						self.init(systemName: "lock")
					case .switch:
						self.init(systemName: "arrow.right.arrow.left")
					case .externalLink:
						self.init(systemName: "arrow.up.forward.square")
          case .arrowRight:
            self.init(systemName: "arrow.right")
          case .select:
            self.init(systemName: "chevron.up.chevron.down")
          case .trash:
            self.init(systemName: "trash")
          case .archiveBox:
            self.init(systemName: "archivebox")
          case .clock:
            self.init(systemName: "clock")
          case .questionMark:
            self.init(systemName: "questionmark")
          case .shieldLock:
            self.init(systemName: "lock.shield")
          case .joinTeam:
            self.init(systemName: "person.fill.badge.plus")
          case .leaveTeam:
            self.init(systemName: "person.badge.minus")

            // MARK: Custom
          case .bolt:
            self.init("bolt", bundle: .module)
          case .great:
            self.init("great", bundle: .module)
          case .seasonRanking:
            self.init("seasonRanking", bundle: .module)
          case .globalRanking:
            self.init("globalRanking", bundle: .module)
				}
		}
	}
}

public struct BonesIcon: View {
	let icon: BonesIconStyle
	let fontWeight: Font.Weight
	let renderingMode: Image.TemplateRenderingMode

  /// Initializes a `BonesIcon` view with the specified parameters.
  ///
  /// - Parameters:
  ///   - icon: A `BonesIconStyle` value representing the icon style to use.
  ///   - fontWeight: The weight of the font to use. Default value is `.bold`.
  ///   - renderingMode: The rendering mode of the image. Default value is `.original`.
	public init(icon: BonesIconStyle,
							fontWeight: Font.Weight = .light,
							renderingMode: Image.TemplateRenderingMode = .original) {
		self.icon          = icon
		self.fontWeight    = fontWeight
		self.renderingMode = renderingMode
	}

  /// Creates the icon as an Image.
  ///
  /// - Returns: An `Image` view representing the icon.
	private func makeIcon() -> Image {
		Image(icon)
			.renderingMode(renderingMode)
			.resizable()
	}

  /// The content and behavior of the `BonesIcon` view.
	public var body: some View {
    makeIcon()
      .fontWeight(fontWeight)
      .scaledToFit()
	}
}

// MARK: - Preview
/// A preview structure to visualize `BonesIcon`.
struct Preview_Icons: View {
	var body: some View {
		List {
			ForEach(BonesIconToken.allCases) { icon in
				HStack {
					Text(icon.id.toWords)
						.font(.custom(.bones(.body)))
					Spacer()
					BonesIcon(icon: .bones(icon))
						.frame(width: 24, height: 24)
				}
			}
		}
		.listBackgroundColor()
	}
}

#Preview {
	Preview_Icons()
}
