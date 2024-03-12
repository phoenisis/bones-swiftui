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
}
