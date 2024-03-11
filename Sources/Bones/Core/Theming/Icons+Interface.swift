//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import Foundation

/// `BonesIconStyle` is an enumeration representing the style of icons.
///
/// Currently, it allows for icons to be represented in a specific bones style.
public enum BonesIconStyle {
  /// Represents an icon style with a specific `BonesIconToken`.
  ///
  /// - Parameter style: A `BonesIconToken` representing the specific icon.
  case bones(_ style: BonesIconToken)
}

/// `BonesIconToken` is an enumeration of various icons identifiers.
///
/// Each case in this enumeration represents a unique icon used throughout the application.
public enum BonesIconToken: String, CaseIterable, Identifiable {
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

  // MARK: Custom
  case bolt
  case great
  case seasonRanking
  case globalRanking

	public var id: String { rawValue }
}
