//
//  Formatters.swift
//
//
//  Created by Quentin PIDOUX on 24/11/2023.
//

import Foundation

  /// Extends `SignedInteger` to include a method for converting numbers to their ordinal representation.
extension SignedInteger {
    /// Converts the integer to its ordinal string representation.
    ///
    /// This method utilizes `NumberFormatter` with the ordinal number style to convert
    /// an integer to a locale-appropriate ordinal string (e.g., 1st, 2nd, 3rd in English).
    ///
    /// - Parameter locale: The locale to use for formatting. Defaults to the current locale.
    /// - Returns: A string representing the ordinal form of the number, or a string of the number itself
    ///            if formatting fails.
  public func ordinalString(locale: Locale = .current) -> String {
    let formatter = NumberFormatter()
    formatter.locale = locale
    formatter.numberStyle = .ordinal
    guard let number = self as? NSNumber else { return "\(self)" }
    return formatter.string(from: number) ?? "\(self)"
  }
}
