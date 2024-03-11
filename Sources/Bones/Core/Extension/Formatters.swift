//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 24/11/2023.
//

import Foundation

extension SignedInteger {
#if canImport(Foundation)
  /// SwifterSwift: Ordinal representation of an integer.
  ///
  ///        print((12).ordinalString()) // prints "12th"
  ///
  /// - Parameter locale: locale, default is .current.
  /// - Returns: string ordinal representation of number in specified locale language. E.g. input 92, output in "en": "92nd".
  @available(macOS 10.11, *)
  public func ordinalString(locale: Locale = .current) -> String {
    let formatter = NumberFormatter()
    formatter.locale = locale
    formatter.numberStyle = .ordinal
    guard let number = self as? NSNumber else { return "\(self)" }
    return formatter.string(from: number) ?? "\(self)"
  }
#endif
}
