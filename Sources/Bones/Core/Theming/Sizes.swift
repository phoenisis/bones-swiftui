//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import Foundation

/// Defines the radius sizes in the Bones design system.
public enum BonesRadius { case bones(BonesRadiusToken) }

/// Defines the padding sizes in the Bones design system.
public enum BonesPadding { case bones(BonesPaddingToken) }

/// Tokens representing different radius sizes in the Bones design system.
public enum BonesRadiusToken: Double, CaseIterable, Identifiable {
  case none
	case small
	case medium
  case large

  /// The raw value of the radius token, based on the design specifications.
	public var rawValue: Double {
		switch self {
      case .none: return 0
			case .small:  return Double.bones.radius.small
      case .medium: return Double.bones.radius.medium
			case .large: return Double.bones.radius.large
		}
	}

	public var id: String {
		switch self {
      case .none: return "none"
			case .small:  return "small"
      case .medium: return "medium"
			case .large: return "large"
		}
	}
}

/// Tokens representing different padding sizes in the Bones design system.
public enum BonesPaddingToken: Double, CaseIterable, Identifiable {
  case none
	/// Minimum size : 4px
	case small
	/// Minimum size : 8px
	case medium
	/// Minimum size : 16px
	case large
	/// Minimum size : 32px
	case xLarge
	/// Minimum size : 64px
	case xxLarge

	public var rawValue: Double {
		switch self {
      case .none: return 0
			case .small: return Double.bones.padding.small
			case .medium: return Double.bones.padding.medium
			case .large: return Double.bones.padding.large
			case .xLarge: return Double.bones.padding.xLarge
			case .xxLarge: return Double.bones.padding.xxLarge
		}
	}

	public var id: String {
		switch self {
      case .none: return "none"
			case .small: return "small"
			case .medium: return "medium"
			case .large: return "large"
			case .xLarge: return "xLarge"
			case .xxLarge: return "xxLarge"
		}
	}
}

/// Extends `Double` to include the Bones design sizes for padding and radius.
public extension Double {
	struct bones {
		struct padding {
			public static var small    = envTheme.sizes.padding.small
			public static var medium   = envTheme.sizes.padding.medium
			public static var large    = envTheme.sizes.padding.large
			public static var xLarge   = envTheme.sizes.padding.xLarge
			public static var xxLarge  = envTheme.sizes.padding.xxLarge
		}

		struct radius {
			public static var small  = isSquareDesign ? 0 : envTheme.sizes.radius.small
      public static var medium = isSquareDesign ? 0 : envTheme.sizes.radius.medium
			public static var large = isSquareDesign ? 0 : envTheme.sizes.radius.large
		}
	}
}

/// Extends `Int` to provide easy access to Bones design sizes as integer values.
public extension Int {
	struct bones {
		struct padding {
      public var none     = 0
			public var small    = Int(Double.bones.padding.small)
			public var medium   = Int(Double.bones.padding.medium)
			public var large    = Int(Double.bones.padding.large)
			public var xLarge   = Int(Double.bones.padding.xLarge)
			public var xxLarge  = Int(Double.bones.padding.xxLarge)
		}

		struct radius {
			public var small  = isSquareDesign ? 0 : Int(Double.bones.radius.small)
			public var medium = isSquareDesign ? 0 : Int(Double.bones.radius.medium)
		}
	}
}

/// Extends `Float` to provide easy access to Bones design sizes as float values.
public extension Float {
	struct bones {
		struct padding {
      public var none     = 0
			public var small    = Float(Double.bones.padding.small)
			public var medium   = Float(Double.bones.padding.medium)
			public var large    = Float(Double.bones.padding.large)
			public var xLarge   = Float(Double.bones.padding.xLarge)
			public var xxLarge  = Float(Double.bones.padding.xxLarge)
		}

		struct radius {
			public var small  = isSquareDesign ? 0 : Float(Double.bones.radius.small)
			public var medium = isSquareDesign ? 0 : Float(Double.bones.radius.medium)
		}
	}
}

/// Extends `CGFloat` to provide easy access to Bones design sizes as CGFloat values.
public extension CGFloat {
	struct bones {
		struct padding {
      public var none     = 0
			public var small    = CGFloat(Double.bones.padding.small)
			public var medium   = CGFloat(Double.bones.padding.medium)
			public var large    = CGFloat(Double.bones.padding.large)
			public var xLarge   = CGFloat(Double.bones.padding.xLarge)
			public var xxLarge  = CGFloat(Double.bones.padding.xxLarge)
		}

		struct radius {
			public var small  = isSquareDesign ? 0 : CGFloat(Double.bones.radius.small)
			public var medium = isSquareDesign ? 0 : CGFloat(Double.bones.radius.medium)
		}
	}
}
