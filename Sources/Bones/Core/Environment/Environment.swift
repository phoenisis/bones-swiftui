//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import Foundation
import SwiftUI

/// A Boolean value indicating whether the design is square or not.
///
/// This computed property accesses the `envTheme.sizes.radius.isSquareDesign` property.
public var isSquareDesign: Bool { get { envTheme.sizes.radius.isSquareDesign } }

/// An instance of `EnvTheme`, representing the current environment theme.
public var envTheme: EnvTheme = .init()

/// Represents the current environment theme.
public struct EnvTheme {
  var fonts  : EnvFont   = .init()
  var colors : EnvColors = .init()
  var sizes  : EnvSizes  = .init()
  var assets : EnvAssets = .init()

  public init() {}

  public init(colors: EnvColors) {
    self.colors = colors
  }
}

/// Represents the assets configuration for the environment theme.
public struct EnvAssets: Sendable {
  public let iconPackName,
             appIconUrl,
             customFont,
             splashScreenUrl,
             mascotUrl: String?

  public init() {
    self.iconPackName = nil
    self.appIconUrl = nil
    self.customFont = nil
    self.splashScreenUrl = nil
    self.mascotUrl = nil
  }

  public init(iconPackName: String?, appIconUrl: String?, customFont: String?, splashScreenUrl: String?, mascotUrl: String?) {
    self.iconPackName = iconPackName
    self.appIconUrl = appIconUrl
    self.customFont = customFont
    self.splashScreenUrl = splashScreenUrl
    self.mascotUrl = mascotUrl
  }
}

/// Represents the fonts configuration for the environment theme.
struct EnvFont {
	var isFontRelative: Bool = false
}

/// Represents the color configuration for the environment theme.
public struct EnvColors {
	var background,
			foreground,
			primaryForeground,
			primary,
			primaryLighten,
			primaryDarken,
			secondaryForeground,
			secondary,
			secondaryLighten,
			secondaryDarken,
			textLight,
			textDark,
			success,
			successForeground,
			failure,
			failureForeground,
			white,
			black,
			grey1,
			grey2,
			grey3,
			grey4,
			grey5,
			grey6,
			AQILevel1,
			AQILevel2,
			AQILevel3,
			AQILevel4,
			AQILevel5: String?

  public init() {}

  public init(background: String?, foreground: String?, primaryForeground: String?, primary: String?, primaryLighten: String?, primaryDarken: String?, secondaryForeground: String?, secondary: String?, secondaryLighten: String?, secondaryDarken: String?, textLight: String?, textDark: String?, success: String?, successForeground: String?, failure: String?, failureForeground: String?) {
    self.background = background
    self.foreground = foreground
    self.primaryForeground = primaryForeground
    self.primary = primary
    self.primaryLighten = primaryLighten
    self.primaryDarken = primaryDarken
    self.secondaryForeground = secondaryForeground
    self.secondary = secondary
    self.secondaryLighten = secondaryLighten
    self.secondaryDarken = secondaryDarken
    self.textLight = textLight
    self.textDark = textDark
    self.success = success
    self.successForeground = successForeground
    self.failure = failure
    self.failureForeground = failureForeground
  }
}

/// Represents size configurations such as padding and radius for the environment theme.
struct EnvSizes {
  /// Represents the padding sizes used in the environment theme.
	struct PaddingSize {
    /// Different padding sizes used within the environment theme.
		var small: Double = 4
		var medium: Double = 8
		var large: Double = 16
		var xLarge: Double = 32
		var xxLarge: Double = 64
	}

  /// Represents the radius sizes used in the environment theme.
	struct RadiusSize {
    /// A Boolean value that indicates whether the design uses square corners.
		var isSquareDesign: Bool { get { small == 0 && medium == 0 }}

    /// Different radius sizes used within the environment theme.
		var small: Double = 4
    var medium: Double = 8
		var large: Double = 16
	}

  /// Instances of `PaddingSize` and `RadiusSize` used within the environment theme.
	var padding: PaddingSize = .init()
	var radius: RadiusSize  = .init()
}


public struct PageBackgroundColorKey: EnvironmentKey {
  public static let defaultValue: Color = .bones.background
}

public extension EnvironmentValues {
  var pageBackgroundColor: Color {
    get { self[PageBackgroundColorKey.self] }
    set { self[PageBackgroundColorKey.self] = newValue }
  }
}
