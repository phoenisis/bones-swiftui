//
//  Typography+UIKit.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI
#if canImport(UIKit)
  import UIKit
#endif

var fontsTTFUIKitLoaded: Bool = false
var fontsOTFUIKitLoaded: Bool = false
/// Extends `UIFont` to support loading and using custom fonts defined for SwiftUI `Font`.
///
/// This extension introduces methods for loading TTF and OTF fonts into UIKit applications,
/// similar to the mechanism provided for SwiftUI. It allows UIKit to utilize the same
/// custom fonts defined for SwiftUI, ensuring consistency across the application.
extension UIFont {
  /// Loads TrueType Fonts (TTF) from the application bundle for use with `UIFont`.
  ///
  /// This method locates and registers TTF font files based on the custom font names
  /// defined in `Font.BonesFontName`, making them available for use in UIKit components.
  static func loadFontsTTF() {
    guard !fontsTTFUIKitLoaded else { return }
    Font.BonesFontName.allCases
      .map { Bundle.module.url(forResource: Optional($0.rawValue), withExtension: "ttf") }
      .compactMap { $0 }
      .forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
    
    fontsTTFUIKitLoaded = true
  }
  
  /// Loads OpenType Fonts (OTF) from the application bundle for use with `UIFont`.
  ///
  /// Similar to `loadFontsTTF`, this method locates and registers OTF font files for
  /// all custom font names, ensuring these fonts can be utilized in UIKit components.
  static func loadFontsOTF() {
    guard !fontsOTFUIKitLoaded else { return }
    Font.BonesFontName.allCases
      .map { Bundle.module.url(forResource: Optional($0.rawValue), withExtension: "otf") }
      .compactMap { $0 }
      .forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
    fontsOTFUIKitLoaded = true
  }
  
  /// Initializes a `UIFont` instance based on a `Font.BonesFontStyle`.
  ///
  /// This initializer allows the direct creation of `UIFont` instances from the custom
  /// font styles defined for SwiftUI, facilitating the use of these fonts in UIKit components.
  /// It dynamically selects the appropriate font and size based on the specified style,
  /// including handling accessibility settings like bold text enhancement.
  ///
  /// - Parameter style: The `Font.BonesFontStyle` specifying the desired font style.
  public convenience init(_ style: Font.BonesFontStyle) {
    UIFont.loadFontsTTF()
    UIFont.loadFontsOTF()
    
    // Define UIFont instances based on the custom BonesFontStyle.
    let h1: Font.BonesFont = .bones(size: 32, weight: .black)
    let h2: Font.BonesFont = .bones(size: 24, weight: .black)
    let h3: Font.BonesFont = .bones(size: 20, weight: .black)
    let body: Font.BonesFont = .bones(size: 16, weight: .regular)
    let bodyBold: Font.BonesFont = .bones(size: 16, weight: .bold)
    let small: Font.BonesFont = .bones(size: 12, weight: .regular)
    let smallBold: Font.BonesFont = .bones(size: 12, weight: .bold)
    let extraSmall: Font.BonesFont = .bones(size: 10, weight: .regular)
    let extraSmallBold: Font.BonesFont = .bones(size: 10, weight: .bold)
    
    // Select and initialize the UIFont based on the provided BonesFontStyle.
    switch style {
      case .bones(style: let style):
        switch style {
          case .h1:
            self.init(name: h1.name, size: h1.size)! 
          case .h2:
            self.init(name: h2.name, size: h2.size)!
          case .h3:
            self.init(name: h3.name, size: h3.size)!
          case .body:
            self.init(name: UIAccessibility.isBoldTextEnabled ? bodyBold.name : body.name, size: body.size)!
          case .bodyBold:
            self.init(name: bodyBold.name, size: bodyBold.size)!
          case .small:
            self.init(name: UIAccessibility.isBoldTextEnabled ? smallBold.name : small.name, size: small.size)!
          case .smallBold:
            self.init(name: smallBold.name, size: smallBold.size)!
          case .extraSmall:
            self.init(name: UIAccessibility.isBoldTextEnabled ? extraSmallBold.name : extraSmall.name, size: extraSmall.size)!
          case .extraSmallBold:
            self.init(name: extraSmallBold.name, size: extraSmallBold.size)!
        }
    }
  }
}
