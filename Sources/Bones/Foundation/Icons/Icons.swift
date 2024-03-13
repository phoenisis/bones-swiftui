//
//  Icons.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import Foundation
import SwiftUI

/// A representation of icon styles for use in the application.
public enum BonesIconStyle {
  case bones(_ style: Image.BonesImage)
}

extension Image {
  /// Defines a comprehensive list of icons used throughout the application.
  ///
  /// This enumeration includes system icons, custom icons, and placeholders for icons
  /// loaded from image assets. It leverages SwiftUI's `Image` system for easy integration
  /// and consistent use across the application.
  public enum BonesImage: String, CaseIterable, Identifiable {
    case play
    case pause
    case finish
    case chevronRight
    case chevronLeft
    case chevronUp
    case chevronDown
    case chevronDownCompact
    case add
    case close
    case search
    case filter
    case filterFill
    case passwordOn
    case passwordOff
    case user
    case userSlash
    case team
    case like
    case likeFill
    case comment
    case share
    case bookmark
    case bookmarkFill
    case checkmark
    case more
    case settings
    case camera
    case photoLibrary
    case reset
    case send
    case star
    case starFill
    case future
    case past
    case durationUndetermined
    case lock
    case `switch`
    case externalLink
    case arrowRight
    case select
    case trash
    case archiveBox
    case clock
    case questionMark
    case shieldLock
    case joinTeam
    case leaveTeam
    
    // Custom icons, loaded from image assets
    case bolt
    case great
    case seasonRanking
    case globalRanking
    
    /// Provides a unique identifier for each icon.
    public var id: String { String(reflecting: self) }
  }
  
  /// Initializes an `Image` with a specified `BonesIconStyle`.
  ///
  /// This initializer selects the appropriate image based on the specified icon style,
  /// supporting both system and custom icons. It enables the consistent use of icons
  /// throughout the application's UI components.
  ///
  /// - Parameter type: The `BonesIconStyle` specifying the desired icon.
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

/// A view wrapper for displaying icons with specific styles and properties.
public struct BonesIcon: View {
  let icon: BonesIconStyle
  let fontWeight: Font.Weight
  let renderingMode: Image.TemplateRenderingMode
  
  /// Initializes a `BonesIcon` view with specified icon, font weight, and rendering mode.
  ///
  /// - Parameters:
  ///   - icon: The `BonesIconStyle` specifying the icon to display.
  ///   - fontWeight: The `Font.Weight` to apply to the icon (if applicable).
  ///   - renderingMode: The `Image.TemplateRenderingMode` to use for rendering the icon.
  public init(icon: BonesIconStyle,
              fontWeight: Font.Weight = .light,
              renderingMode: Image.TemplateRenderingMode = .original) {
    self.icon          = icon
    self.fontWeight    = fontWeight
    self.renderingMode = renderingMode
  }
  
  /// Constructs the icon `Image` view with appropriate styling.
  ///
  /// This method creates an `Image` based on the specified `BonesIconStyle`, applying
  /// the rendering mode and scaling it to fit.
  private func makeIcon() -> Image {
    Image(icon)
      .renderingMode(renderingMode)
      .resizable()
  }
  
  /// The body of the `BonesIcon` view.
  ///
  /// Composes the icon `Image` and applies the specified font weight, rendering mode,
  /// and scaling to fit within its container.
  public var body: some View {
    makeIcon()
      .fontWeight(fontWeight)
      .scaledToFit()
  }
}
