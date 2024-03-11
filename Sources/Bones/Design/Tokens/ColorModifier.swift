//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import SwiftUI

/// Simplifies the initialization of `Color` using a custom color type.
///
/// This extension provides an initializer that accepts an instance of `BonesColor`,
/// and uses it to initialize a SwiftUI `Color`.
extension Color {
  /// Initializes a `Color` object using a `BonesColor` enum.
  ///
  /// - Parameter color: A `BonesColor` enum case.
	public init(_ color: BonesColor) {
		switch color {
			case .bones(let colorType):
				let colorCustom = switch colorType {
					case .background: Color(hex: envTheme.colors.background)
					case .foreground: Color(hex: envTheme.colors.foreground)
					case .primaryForeground: Color(hex: envTheme.colors.primaryForeground)
					case .primary: Color(hex: envTheme.colors.primary)
					case .primaryLighten: Color(hex: envTheme.colors.primaryLighten)
					case .primaryDarken: Color(hex: envTheme.colors.primaryDarken)
					case .secondaryForeground: Color(hex: envTheme.colors.secondaryForeground)
					case .secondary: Color(hex: envTheme.colors.secondary)
					case .secondaryLighten: Color(hex: envTheme.colors.secondaryLighten)
					case .secondaryDarken: Color(hex: envTheme.colors.secondaryDarken)
					case .textLight: Color(hex: envTheme.colors.textLight)
					case .textDark: Color(hex: envTheme.colors.textDark)
					case .success: Color(hex: envTheme.colors.success)
					case .successForeground: Color(hex: envTheme.colors.successForeground)
					case .failure: Color(hex: envTheme.colors.failure)
					case .failureForeground: Color(hex: envTheme.colors.failureForeground)
					case .white: Color(hex: envTheme.colors.white)
					case .black: Color(hex: envTheme.colors.black)
					case .grey1: Color(hex: envTheme.colors.grey1)
					case .grey2: Color(hex: envTheme.colors.grey2)
					case .grey3: Color(hex: envTheme.colors.grey3)
					case .grey4: Color(hex: envTheme.colors.grey4)
					case .grey5: Color(hex: envTheme.colors.grey5)
					case .grey6: Color(hex: envTheme.colors.grey6)
					case .AQILevel1: Color(hex: envTheme.colors.AQILevel1)
					case .AQILevel2: Color(hex: envTheme.colors.AQILevel2)
					case .AQILevel3: Color(hex: envTheme.colors.AQILevel3)
					case .AQILevel4: Color(hex: envTheme.colors.AQILevel4)
					case .AQILevel5: Color(hex: envTheme.colors.AQILevel5)
				}

				if let colorCustom { self.init(color: colorCustom) } else { self.init("B.\(colorType.rawValue)", bundle: .module) }
		}
	}
}

/// A collection of static color values.
///
/// This extension provides a set of static color values that are easily accessible.
public extension Color {
	struct bones {
		public static let background = Color(BonesColor.bones(.background))
		public static let foreground = Color(BonesColor.bones(.foreground))

		public static let primary           = Color(BonesColor.bones(.primary))
		public static let primaryForeground = Color(BonesColor.bones(.primaryForeground))
		public static let primaryLighten    = Color(BonesColor.bones(.primaryLighten))
		public static let primaryDarken     = Color(BonesColor.bones(.primaryDarken))

		public static let secondary           = Color(BonesColor.bones(.secondary))
		public static let secondaryForeground = Color(BonesColor.bones(.secondaryForeground))
		public static let secondaryLighten    = Color(BonesColor.bones(.secondaryLighten))
		public static let secondaryDarken     = Color(BonesColor.bones(.secondaryDarken))

		public static let textLight = Color(BonesColor.bones(.textLight))
		public static let textDark  = Color(BonesColor.bones(.textDark))

		public static let success           = Color(BonesColor.bones(.success))
		public static let successForeground = Color(BonesColor.bones(.successForeground))

		public static let failure           = Color(BonesColor.bones(.failure))
		public static let failureForeground = Color(BonesColor.bones(.failureForeground))
		public static let alert             = Color(BonesColor.bones(.failure))
		public static let alertForeground   = Color(BonesColor.bones(.failureForeground))

		public static let white     = Color(BonesColor.bones(.white))
		public static let black     = Color(BonesColor.bones(.black))

		public static let grey1     = Color(BonesColor.bones(.grey1))
		public static let grey2     = Color(BonesColor.bones(.grey2))
		public static let grey3     = Color(BonesColor.bones(.grey3))
		public static let grey4     = Color(BonesColor.bones(.grey4))
		public static let grey5     = Color(BonesColor.bones(.grey5))
		public static let grey6     = Color(BonesColor.bones(.grey6))

		public static let AQILevel1 = Color(BonesColor.bones(.AQILevel1))
		public static let AQILevel2 = Color(BonesColor.bones(.AQILevel2))
		public static let AQILevel3 = Color(BonesColor.bones(.AQILevel3))
		public static let AQILevel4 = Color(BonesColor.bones(.AQILevel4))
		public static let AQILevel5 = Color(BonesColor.bones(.AQILevel5))
	}
}

// MARK: - Color private file extension
/// Contains fileprivate color utility extensions.
fileprivate extension Color {
	var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
		typealias NativeColor = UIColor

		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var o: CGFloat = 0

		guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
			// You can handle the failure here as you want
			return (0, 0, 0, 0)
		}

		return (r, g, b, o)
	}

	init(color: Color) {
		self.init(red: color.components.red, green: color.components.green, blue: color.components.blue, opacity: color.components.opacity)
	}

	init?(hex: String?) {
		guard let hex else { return nil }

		let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
		var rgb: UInt64 = 0
		guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

		let r, g, b, a: CGFloat
		switch hexSanitized.count {
			case 6:
				(r, g, b, a) = (CGFloat((rgb & 0xFF0000) >> 16) / 255.0, CGFloat((rgb & 0x00FF00) >> 8) / 255.0, CGFloat(rgb & 0x0000FF) / 255.0, 1.0)
			case 8:
				(r, g, b, a) = (CGFloat((rgb & 0xFF000000) >> 24) / 255.0, CGFloat((rgb & 0x00FF0000) >> 16) / 255.0, CGFloat((rgb & 0x0000FF00) >> 8) / 255.0, CGFloat(rgb & 0x000000FF) / 255.0)
			default:
				return nil
		}

		self.init(red: r, green: g, blue: b, opacity: a)
	}
}

// MARK: - Preview
/// A preview struct for colors.
///
/// This struct provides a SwiftUI view that previews a color.
fileprivate struct ColorsPreview: View {
	var colorType: BonesColorToken
	@State var isExpended: Bool = false

  var body: some View {
		HStack {
			Text(colorType.id.toWords)
				.font(.custom(.bones(.body)))

			Spacer()

			Circle()
				.foregroundStyle(
					Color(BonesColor.bones(colorType))
						.shadow(.bones.drop(.close))
				)
				.frame(width: 50, height: 50)
				.onTapGesture {
					isExpended.toggle()
				}
		}
		.sheet(isPresented: $isExpended, content: {
			NavigationStack {
				ScrollView {}
					.background(Color(BonesColor.bones(colorType)))
			}
			.presentationDetents([.medium, .large])
		})
	}
}

/// A SwiftUI view providing a list of color previews.
///
/// This struct displays a list of color previews using the `ColorsPreview` struct.
struct Preview_Colors: View {
	var body: some View {
		List {
			ForEach(BonesColorToken.allCases) { color in
				ColorsPreview(colorType: color)
			}
		}
		.listBackgroundColor()
	}
}

/// Provides the capability to apply a tint to any view.
public extension View {
  /// Sets the tint color of the view.
  ///
  /// - Parameter bonesTint: An optional `BonesColor` to use as the tint.
  /// - Returns: A view with the applied tint color.
  @inlinable func tint(_ bonesTint: BonesColor?) -> some View {
    self.tint(bonesTint != nil ? Color(bonesTint!) : nil)
  }
}

#Preview {
	Preview_Colors()
}
