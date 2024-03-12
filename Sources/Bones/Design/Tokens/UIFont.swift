//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 20/10/2023.
//

import UIKit
import SwiftUI

extension UIFont {
  /// Loads TrueType fonts (TTF) bundled with the module.
  /// Iterates through all cases of `BonesFontName` enum and tries to load each font.
  public static func loadFontsTTF() {
    Font.BonesFontName.allCases
      .map { Bundle.module.url(forResource: Optional($0.rawValue), withExtension: "ttf") }
      .compactMap { $0 }
      .forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
  }

  /// Loads OpenType fonts (OTF) bundled with the module.
  /// Iterates through all cases of `BonesFontName` enum and tries to load each font.
  public static func loadFontsOTF() {
    Font.BonesFontName.allCases
      .map { Bundle.module.url(forResource: Optional($0.rawValue), withExtension: "otf") }
      .compactMap { $0 }
      .forEach { CTFontManagerRegisterFontsForURL($0 as CFURL, .process, nil) }
  }

  /// Initializes a new font object based on the specified style.
  ///
  /// - Parameter style: The style of the font as defined in `BonesFontStyle`.
  public convenience init(_ style: Font.BonesFontStyle) {
    UIFont.loadFontsTTF()
    UIFont.loadFontsOTF()

    let h1: Font.BonesFont = .bones(size: 32, weight: .black)
    let h2: Font.BonesFont = .bones(size: 24, weight: .black)
    let h3: Font.BonesFont = .bones(size: 20, weight: .black)
    let body: Font.BonesFont = .bones(size: 16, weight: .regular)
    let bodyBold: Font.BonesFont = .bones(size: 16, weight: .bold)
    let small: Font.BonesFont = .bones(size: 12, weight: .regular)
    let smallBold: Font.BonesFont = .bones(size: 12, weight: .bold)
    let extraSmall: Font.BonesFont = .bones(size: 10, weight: .regular)
    let extraSmallBold: Font.BonesFont = .bones(size: 10, weight: .bold)

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
