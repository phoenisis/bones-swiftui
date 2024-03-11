//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import Foundation

/// An enumeration of font names available in the application.
public enum BonesFontName: String, CaseIterable {
	case manropeLight     = "Manrope-Light"
	case manropeMedium    = "Manrope-Medium"
	case manropeRegular   = "Manrope-Regular"
	case manropeSemiBold  = "Manrope-SemiBold"
	case manropeBold      = "Manrope-Bold"
	case manropeExtraBold = "Manrope-ExtraBold"

	case interThin       = "Inter-Thin"
	case interExtraLight = "Inter-ExtraLight"
	case interLight      = "Inter-Light"
	case interRegular    = "Inter-Regular"
	case interMedium     = "Inter-Medium"
	case interSemiBold   = "Inter-SemiBold"
	case interBold       = "Inter-Bold"
	case interExtraBold  = "Inter-ExtraBold"
	case interBlack      = "Inter-Black"

	case relativeBook = "Relative-Book"
	case relativeBold = "Relative-Bold"

  case epilogueThin       = "Epilogue-Thin"
  case epilogueExtraLight = "Epilogue-ExtraLight"
  case epilogueLight      = "Epilogue-Light"
  case epilogueRegular    = "Epilogue-Regular"
  case epilogueMedium     = "Epilogue-Medium"
  case epilogueSemiBold   = "Epilogue-SemiBold"
  case epilogueBold       = "Epilogue-Bold"
  case epilogueExtraBold  = "Epilogue-ExtraBold"
  case epilogueBlack      = "Epilogue-Black"
}

/// Represents different weights for fonts.
public enum BonesFontWeight {
	case light
	case medium
	case regular
	case semiBold
	case bold
	case extraBold
	case black
}

/// `BonesFont` represents a font with a specified size and weight.
public enum BonesFont {
	case bones(size: CGFloat, weight: BonesFontWeight)

	var name: String {
		switch self {
			case .bones(_, let weight):
				switch weight {
					case BonesFontWeight.light:
						return envTheme.fonts.isFontRelative
						? BonesFontName.relativeBook.rawValue
						: BonesFontName.interLight.rawValue
					case BonesFontWeight.medium:
						return envTheme.fonts.isFontRelative
						? BonesFontName.relativeBook.rawValue
						: BonesFontName.interMedium.rawValue
					case BonesFontWeight.regular:
						return envTheme.fonts.isFontRelative
						? BonesFontName.relativeBook.rawValue
						: BonesFontName.interRegular.rawValue
					case BonesFontWeight.semiBold:
						return envTheme.fonts.isFontRelative
						? BonesFontName.relativeBook.rawValue
						: BonesFontName.interSemiBold.rawValue
					case BonesFontWeight.bold:
						return envTheme.fonts.isFontRelative
						? BonesFontName.relativeBold.rawValue
						: BonesFontName.interBold.rawValue
					case BonesFontWeight.extraBold:
						return envTheme.fonts.isFontRelative
						? BonesFontName.relativeBold.rawValue
						: BonesFontName.interExtraBold.rawValue
					case BonesFontWeight.black:
						return envTheme.fonts.isFontRelative
						? BonesFontName.relativeBold.rawValue
						: BonesFontName.interBlack.rawValue
				}
		}
	}

	var size: CGFloat {
		switch self {
			case .bones(let size, _):
				return size
		}
	}
}

/// A style representation for fonts.
public enum BonesFontStyle { case bones(_ style: BonesFontToken) }

/// `BonesFontToken` represents predefined font styles used across the application.
public enum BonesFontToken: String, CaseIterable, Identifiable {
	case h1
	case h2
	case h3
	case body
	case bodyBold
	case small
	case smallBold
	case extraSmall
	case extraSmallBold

	public var id: String { rawValue }
}
