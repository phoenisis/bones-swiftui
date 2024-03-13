  //
  //  Colors.swift
  //
  //
  //  Created by Quentin PIDOUX on 13/03/2024.
  //

import SwiftUI

  /// A global dictionary to map `BonesColorToken` to hexadecimal color strings.
var bonesColors: [Color.BonesColorToken: String] = [:]

  /// An enumeration to encapsulate color styles within the application.
public enum BonesColor { case bones(Color.BonesColorToken) }

extension Color {
    /// An enumeration of color tokens used throughout the application.
    ///
    /// This enum defines a comprehensive set of colors represented as tokens,
    /// enabling a consistent and flexible color system within the app.
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
  
    /// Initializes a `Color` instance with a specified `BonesColor`.
    ///
    /// Attempts to initialize the color using a hex code from `bonesColors`.
    /// If no hex code is found, it falls back to a color defined in assets.
    ///
    /// - Parameter color: The `BonesColor` enum specifying the desired color token.
  public init(_ color: BonesColor) {
    switch color {
      case .bones(let colorType):
        let colorCustom = Color.init(hex: bonesColors[colorType])
        
        self = colorCustom ?? Color("B.\(colorType.rawValue)", bundle: .module)
    }
  }
  
    /// A structure to conveniently access the application's color scheme.
  public struct bones {
    public static let background = Color(.bones(.background))
    public static let foreground = Color(.bones(.foreground))
    
    public static let primary = Color(.bones(.primary))
    public static let primaryForeground = Color(.bones(.primaryForeground))
    public static let primaryLighten = Color(.bones(.primaryLighten))
    public static let primaryDarken = Color(.bones(.primaryDarken))
    
    public static let secondary = Color(.bones(.secondary))
    public static let secondaryForeground = Color(.bones(.secondaryForeground))
    public static let secondaryLighten = Color(.bones(.secondaryLighten))
    public static let secondaryDarken = Color(.bones(.secondaryDarken))
    
    public static let textLight = Color(.bones(.textLight))
    public static let textDark = Color(.bones(.textDark))
    
    public static let success = Color(.bones(.success))
    public static let successForeground = Color(.bones(.successForeground))
    
    public static let failure = Color(.bones(.failure))
    public static let failureForeground = Color(.bones(.failureForeground))
    public static let alert = Color(.bones(.failure))
    public static let alertForeground = Color(.bones(.failureForeground))
    
    public static let white = Color(.bones(.white))
    public static let black = Color(.bones(.black))
    
    public static let grey1 = Color(.bones(.grey1))
    public static let grey2 = Color(.bones(.grey2))
    public static let grey3 = Color(.bones(.grey3))
    public static let grey4 = Color(.bones(.grey4))
    public static let grey5 = Color(.bones(.grey5))
    public static let grey6 = Color(.bones(.grey6))
    
    public static let AQILevel1 = Color(.bones(.AQILevel1))
    public static let AQILevel2 = Color(.bones(.AQILevel2))
    public static let AQILevel3 = Color(.bones(.AQILevel3))
    public static let AQILevel4 = Color(.bones(.AQILevel4))
    public static let AQILevel5 = Color(.bones(.AQILevel5))
  }
}

// MARK: - Color private file extension
fileprivate extension Color {
  /// Decomposes a `Color` into its red, green, blue, and opacity components.
  var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {
    typealias NativeColor = UIColor
    var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, o: CGFloat = 0
    guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
      return (0, 0, 0, 0)
      }
    return (r, g, b, o)
    }
  
  /// Initializes a `Color` with another `Color` instance.
  ///
  /// - Parameter color: The `Color` to clone.
  init(color: Color) {
    self.init(red: color.components.red, green: color.components.green, blue: color.components.blue, opacity: color.components.opacity)
    }
  
  /// Initializes a `Color` with a hexadecimal color code.
  ///
  /// - Parameter hex: The hexadecimal color code string.
  init?(hex: String?) {
    guard let hexString = hex?.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: ""),
          let rgbValue = UInt64(hexString, radix: 16) else { return nil }
    
    let red = CGFloat((rgbValue >> 16) & 0xff) / 255
    let green = CGFloat((rgbValue >> 8) & 0xff) / 255
    let blue = CGFloat(rgbValue & 0xff) / 255
    self.init(red: red, green: green, blue: blue)
    }
}
