//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import SwiftUI

/// Extension to the `Font` struct for loading and using custom fonts in the app.
extension Font {
  /// Loads TrueType fonts (TTF) bundled with the module.
  /// Iterates through all cases of `BonesFontName` enum and tries to load each font.
	public static func loadFontsTTF() {
		BonesFontName.allCases
			.map { Bundle.module.url(forResource: Optional($0.rawValue), withExtension: "ttf") }
			.compactMap { $0 }
			.forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
	}

  /// Loads OpenType fonts (OTF) bundled with the module.
  /// Iterates through all cases of `BonesFontName` enum and tries to load each font.
	public static func loadFontsOTF() {
		BonesFontName.allCases
			.map { Bundle.module.url(forResource: Optional($0.rawValue), withExtension: "otf") }
			.compactMap { $0 }
			.forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
	}

  /// Creates a `Font` instance with specified attributes.
  /// This is a customized implementation of `Font.custom(_:size:)` function to incorporate custom fonts.
  ///
  /// - Parameters:
  ///   - font: A `BonesFont` instance containing font name and size.
  ///   - size: The size of the text.
  ///   - relativeTo: A text style that the custom font size is relative to.
  /// - Returns: A `Font` instance.
	static func custom(_ font: BonesFont, size: CGFloat, relativeTo: Font.TextStyle) -> Font {
		// load fonts before they can be used
		Font.loadFontsTTF()
		Font.loadFontsOTF()
		// call Apple's Font.custom() function
		// to use the custom font
		// https://developer.apple.com/documentation/swiftui/font/custom(_:size:)
		return Font
			.custom(font.name, size: size)
	}

  /// Another overload of the `custom` function to create a font style with specific attributes.
  ///
  /// - Parameter style: A `BonesFontStyle` enum case.
  /// - Returns: A `Font` instance.
	public static func custom(_ style: BonesFontStyle) -> Font {
		Font.loadFontsTTF()
		Font.loadFontsOTF()

		let h1: BonesFont = .bones(size: 32, weight: .black)
		let h2: BonesFont = .bones(size: 24, weight: .black)
		let h3: BonesFont = .bones(size: 20, weight: .black)
		let body: BonesFont = .bones(size: 16, weight: .medium)
		let bodyBold: BonesFont = .bones(size: 16, weight: .bold)
		let small: BonesFont = .bones(size: 12, weight: .regular)
		let smallBold: BonesFont = .bones(size: 12, weight: .bold)
		let extraSmall: BonesFont = .bones(size: 10, weight: .regular)
		let extraSmallBold: BonesFont = .bones(size: 10, weight: .bold)

		return switch style {
			case .bones(style: let style):
				switch style {
					case .h1:
						Font.custom(h1.name, size: h1.size, relativeTo: .largeTitle)
					case .h2:
						Font.custom(h2.name, size: h2.size, relativeTo: .title)
					case .h3:
						Font.custom(h3.name, size: h3.size, relativeTo: .title2)
					case .body:
            UIAccessibility.isBoldTextEnabled 
            ? Font.custom(bodyBold.name, size: body.size, relativeTo: .body)
            : Font.custom(body.name, size: body.size, relativeTo: .body)

					case .bodyBold:
						Font.custom(bodyBold.name, size: bodyBold.size, relativeTo: .body)
					case .small:
            UIAccessibility.isBoldTextEnabled
						? Font.custom(smallBold.name, size: small.size, relativeTo: .caption)
            : Font.custom(small.name, size: small.size, relativeTo: .caption)
					case .smallBold:
						Font.custom(smallBold.name, size: smallBold.size, relativeTo: .caption)
					case .extraSmall:
            UIAccessibility.isBoldTextEnabled
            ? Font.custom(extraSmallBold.name, size: extraSmall.size, relativeTo: .caption)
            : Font.custom(extraSmall.name, size: extraSmall.size, relativeTo: .caption)
					case .extraSmallBold:
						Font.custom(extraSmallBold.name, size: extraSmallBold.size, relativeTo: .caption)
				}
		}
	}
}

/// A custom `ViewModifier` that applies a specific font style to a view.
struct FontModifier: ViewModifier {
  let font: Font.BonesFontStyle

  /// Modifies the provided content with a custom font style.
  ///
  /// - Parameter content: The view that this modifier will be applied to.
  /// - Returns: A modified view with the custom font style applied.
	func body(content: Content) -> some View {
		// Calling our overloaded implementation of the Font.custom() function
		// which takes a BonesFont
		content
			.font(Font.custom(font))
	}
}

// MARK: View Extension

// Extend View with a function that takes in a custom View Modifier
// This custom View Modifier will add a custom font
// of type BonesFont, to the View
// syntax of calling this function looks similar to:
// https://developer.apple.com/documentation/swiftui/font/system(size:weight:design:)-697b2
extension View {
  /// Applies a font of type `BonesFontStyle` to the View.
  ///
  /// - Parameter font: A specific style of `BonesFontStyle`.
  /// - Returns: A view modified with the specified font style.
  ///
  /// Example usage:
  /// ```swift
  /// Text("Hello, World!")
  ///     .font(.bones(style: .title))
  /// ```
  public func font(_ font: Font.BonesFontStyle) -> some View {
		self
			.modifier(FontModifier(font: font))
	}
}

// MARK: - Preview
/// A struct for previewing different font styles in the canvas.
fileprivate struct FontPreview: View {
  var fontStyle: Font.BonesFontStyle
	var title: String
	@State var isExpended: Bool = false

	let text: String = "Nostrud eu cupidatat mollit ipsum duis ad proident. Cupidatat nulla sint nisi ad labore anim do enim. Excepteur sint exercitation deserunt elit Lorem et nisi aliquip cupidatat veniam ipsum occaecat. Adipisicing laborum anim laboris minim.\nEt laboris nostrud nisi laboris ipsum veniam eiusmod cillum et aliquip consequat irure. Deserunt incididunt qui ex anim ipsum enim. Consectetur ad magna pariatur dolore anim. Anim quis culpa commodo irure Lorem nisi enim pariatur ad magna. Nisi ullamco exercitation elit in ex. Consequat minim nulla veniam proident qui consectetur ut in fugiat ea commodo labore occaecat sunt. Enim dolore commodo dolore. Consectetur eiusmod laboris aliquip non nisi.\nPariatur tempor amet Lorem eu amet elit occaecat irure adipisicing nostrud. Lorem reprehenderit est esse consectetur excepteur sit commodo aliqua excepteur et irure. Tempor culpa ipsum eu esse in laboris excepteur duis in eiusmod et enim. Incididunt reprehenderit commodo ex consectetur reprehenderit laboris consequat Lorem. Non esse fugiat ad nulla nisi ipsum aute sunt aliqua est minim voluptate id reprehenderit. Sit amet amet quis occaecat qui esse adipisicing dolor nisi consequat sunt eu.\nConsequat incididunt cupidatat non deserunt do elit nulla voluptate id id. Eu id qui sit aute sit minim fugiat. Nostrud adipisicing adipisicing dolore mollit. Eu ipsum esse tempor dolore eu culpa ad in. Nostrud duis nulla nulla in consectetur non tempor eu dolor duis occaecat nulla nisi commodo ex.\nEiusmod consequat consectetur sint ea minim et pariatur tempor eu ullamco. Ipsum occaecat reprehenderit exercitation mollit. Laborum elit culpa occaecat eu do quis incididunt irure sit dolor est anim ut qui. Laboris labore pariatur ullamco. Deserunt mollit proident ullamco sit anim elit consequat dolore enim id amet. Minim minim commodo labore voluptate ex fugiat. Aute magna sunt commodo exercitation. Magna do excepteur esse dolor nulla minim."

	var body: some View {
		Section {
			Text(text)
				.font(fontStyle)
				.lineLimit(3)
				.onTapGesture {
					isExpended.toggle()
				}
				.sheet(isPresented: $isExpended, content: {
					NavigationStack {
						ScrollView {
							Text(text)
								.font(fontStyle)
								.padding(.bones(.large))
						}
						.navigationTitle(title.toWords)
					}
					.presentationDetents([.medium, .large])
				})
		} header: {
			Text(title.toWords)
				.font(.custom(.bones(.bodyBold)))
				.foregroundStyle(Color.bones.textDark)
		}
	}
}

struct Preview_Fonts: View {
  var body: some View {
		List {
      ForEach(Font.BonesFontToken.allCases) { font in
				FontPreview(fontStyle: .bones(font), title: font.id)
					.previewDisplayName(font.id)
			}
		}
		.listBackgroundColor()
	}
}

#Preview {
	Preview_Fonts()
}
