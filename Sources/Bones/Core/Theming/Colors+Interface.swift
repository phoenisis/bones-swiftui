//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

/// `BonesColor` is an enumeration that allows the definition of color styles.
///
/// It utilizes the `BonesColorToken` enumeration to allow for a more defined color palette within the application.
public enum BonesColor { case bones(BonesColorToken) }

/// `BonesColorToken` is an enumeration of predefined colors to be used across the application.
///
/// The colors included range from basic colors, grayscale, to more specific use-cases such as text, success, and failure colors.
/// Additionally, it includes colors that represent different AQI Levels.
public enum BonesColorToken: String, CaseIterable, Identifiable {
	case background
	case foreground

	case primaryForeground
	case primary
	case primaryLighten
	case primaryDarken

	case secondaryForeground
	case secondary
	case secondaryLighten
	case secondaryDarken

	case textLight
	case textDark

	case success
	case successForeground

	case failure
	case failureForeground

	case white
	case black

	case grey1
	case grey2
	case grey3
	case grey4
	case grey5
	case grey6

	case AQILevel1
	case AQILevel2
	case AQILevel3
	case AQILevel4
	case AQILevel5

	public var id: String { self.rawValue }
}
