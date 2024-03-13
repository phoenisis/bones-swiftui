//
//  Typography.swift
//
//
//  Created by Quentin PIDOUX on 12/03/2024.
//

import SwiftUI

/// Extends the `Font` struct to include custom font styles and tokens.
///
/// This extension allows for the creation of a flexible and consistent font system
/// within a SwiftUI application, using predefined font styles and tokens.
extension Font {
  /// Represents a custom font style.
  ///
  /// This enum allows for the encapsulation of a font style within the application's
  /// design system, leveraging the `Font.BonesFontToken` to specify the font style.
  public enum BonesFontStyle {
    case bones(_ style: Font.BonesFontToken)
  }
  
  /// An enumeration of font style tokens.
  ///
  /// Defines a set of font style tokens that represent specific text styles (e.g., headings,
  /// body text, small text) within the application. This allows for a consistent application
  /// of font styles across the UI.
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
    
    /// A unique identifier for each font token.
    ///
    /// This property returns the raw value of the enum case, which acts as a unique
    /// identifier for each font style token, facilitating their use in identifiable contexts.
    public var id: String { rawValue }
  }
  
  /// An enumeration of font names.
  ///
  /// Defines a comprehensive list of font names to be used in conjunction with font
  /// styles and tokens. This facilitates the use of custom fonts within the application,
  /// ensuring consistency and ease of use.
  enum BonesFontName: String, CaseIterable {
    case interThin       = "Inter-Thin"
    case interExtraLight = "Inter-ExtraLight"
    case interLight      = "Inter-Light"
    case interRegular    = "Inter-Regular"
    case interMedium     = "Inter-Medium"
    case interSemiBold   = "Inter-SemiBold"
    case interBold       = "Inter-Bold"
    case interExtraBold  = "Inter-ExtraBold"
    case interBlack      = "Inter-Black"
    
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
  
  /// Represents the weight of a font.
  ///
  /// This enum allows for the specification of font weight in the custom font system,
  /// facilitating the precise definition of text appearance based on the design system's
  /// requirements.
  public enum BonesFontWeight {
    case light
    case medium
    case regular
    case semiBold
    case bold
    case extraBold
    case black
  }
  
  /// A struct representing a custom font.
  ///
  /// This structure allows for the specification of a font with a custom size and weight,
  /// facilitating the application of consistent and cohesive font styling throughout the UI.
  public enum BonesFont {
    case bones(size: CGFloat, weight: Font.BonesFontWeight)
    
    /// Retrieves the font name based on the specified weight.
    ///
    /// This computed property selects an appropriate font name from the `BonesFontName`
    /// enum based on the specified font weight, allowing for the dynamic application of
    /// font styles.
    var name: String {
      switch self {
        case .bones(_, let weight):
          switch weight {
            case Font.BonesFontWeight.light:
              return Font.BonesFontName.interLight.rawValue
            case Font.BonesFontWeight.medium:
              return Font.BonesFontName.interMedium.rawValue
            case Font.BonesFontWeight.regular:
              return Font.BonesFontName.interRegular.rawValue
            case Font.BonesFontWeight.semiBold:
              return Font.BonesFontName.interSemiBold.rawValue
            case Font.BonesFontWeight.bold:
              return Font.BonesFontName.interBold.rawValue
            case Font.BonesFontWeight.extraBold:
              return Font.BonesFontName.interExtraBold.rawValue
            case Font.BonesFontWeight.black:
              return Font.BonesFontName.interBlack.rawValue
          }
      }
    }
    
    /// The size of the font.
    ///
    /// This computed property returns the specified size of the font, allowing for the
    /// application of custom font sizes throughout the UI.
    var size: CGFloat {
      switch self {
        case .bones(let size, _):
          return size
      }
    }
  }
  
  /// Loads TrueType Fonts (TTF) from the application bundle.
  ///
  /// This method iterates through all `BonesFontName` cases, attempts to locate the TTF font files
  /// in the module bundle, and registers them with the system for use within the application.
  static func loadFontsTTF() {
    BonesFontName.allCases
      .map { Bundle.module.url(forResource: Optional($0.rawValue), withExtension: "ttf") }
      .compactMap { $0 }
      .forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
  }
  
  /// Loads OpenType Fonts (OTF) from the application bundle.
  ///
  /// Similar to `loadFontsTTF`, this method locates and registers OTF font files
  /// for all `BonesFontName` cases, making them available for use within the app.
  static func loadFontsOTF() {
    BonesFontName.allCases
      .map { Bundle.module.url(forResource: Optional($0.rawValue), withExtension: "otf") }
      .compactMap { $0 }
      .forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
  }
  
  /// Creates a custom font based on the provided `BonesFont`, size, and relative text style.
  ///
  /// - Parameters:
  ///   - font: The `BonesFont` enum value specifying the font and its weight.
  ///   - size: The size of the font.
  ///   - relativeTo: The `Font.TextStyle` to which the font size is relative.
  /// - Returns: A `Font` configured with the specified custom font, size, and relative style.
  static func custom(_ font: BonesFont, size: CGFloat, relativeTo: Font.TextStyle) -> Font {
    Font.loadFontsTTF()
    Font.loadFontsOTF()
    return Font
      .custom(font.name, size: size)
  }
  
  /// Creates a custom font based on a predefined `BonesFontStyle`.
  ///
  /// This method maps predefined font styles to specific font configurations,
  /// taking into account accessibility settings like bold text.
  ///
  /// - Parameter style: The `BonesFontStyle` specifying the font style to use.
  /// - Returns: A `Font` configured for the specified style.
  public static func custom(_ style: BonesFontStyle) -> Font {
    Font.loadFontsTTF()
    Font.loadFontsOTF()
    
    // Define font configurations for different styles.
    let h1: BonesFont = .bones(size: 32, weight: .black)
    let h2: BonesFont = .bones(size: 24, weight: .black)
    let h3: BonesFont = .bones(size: 20, weight: .black)
    let body: BonesFont = .bones(size: 16, weight: .medium)
    let bodyBold: BonesFont = .bones(size: 16, weight: .bold)
    let small: BonesFont = .bones(size: 12, weight: .regular)
    let smallBold: BonesFont = .bones(size: 12, weight: .bold)
    let extraSmall: BonesFont = .bones(size: 10, weight: .regular)
    let extraSmallBold: BonesFont = .bones(size: 10, weight: .bold)
    
    // Select the appropriate font configuration based on the specified style.
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

// MARK: View Extension
/// Extends `View` to easily apply custom fonts based on `BonesFontStyle`.
///
/// This extension provides a convenient method for applying custom fonts to any
/// SwiftUI view, simplifying the process of font customization throughout an application.
extension View {
  /// Applies a custom font to the view based on the specified `BonesFontStyle`.
  ///
  /// - Parameter font: The `BonesFontStyle` specifying the font style to use.
  /// - Returns: The view with the applied custom font.
  public func font(_ font: Font.BonesFontStyle) -> some View {
    self
      .font(Font.custom(font))
  }
}

