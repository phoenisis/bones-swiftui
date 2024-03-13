//
//  Strings.swift
//
//
//  Created by Quentin PIDOUX on 16/10/2023.
//

import Foundation

  /// Extends `String?` to include a computed property for localization.
extension String? {
    /// A computed property that localizes the string if it exists.
    ///
    /// This property checks if the optional string exists and, if so, returns its localized version.
    /// If the string is `nil`, it returns `nil`.
  var localized: String? {
    guard let self else { return nil }
    return NSLocalizedString(self, comment: self)
  }
}

  /// Extends `String` to include methods related to localization and formatting.
extension String {
    /// A computed property that returns the localized version of the string.
  var localized: String {
    NSLocalizedString(self, comment: self)
  }
  
    /// Converts camelCase strings to a space-separated words string.
    ///
    /// This method uses regular expressions to identify camelCase patterns and insert spaces
    /// accordingly. It handles acronyms, normal camelCase, and numbers within the string.
    /// The first letter of the result is capitalized.
    ///
    /// - Returns: A string with spaces inserted to separate camelCase words, with the first letter capitalized.
  func camelCaseToWords() -> String {
    let acronymPattern = "([A-Z]+)([A-Z][a-z]|[0-9])"
    let normalPattern = "([a-z0-9])([A-Z])"
    let spacePattern = "([a-zA-Z])([0-9])"
    
    var result = self
      .replacingOccurrences(of: acronymPattern, with: "$1 $2", options: .regularExpression, range: nil)
      .replacingOccurrences(of: normalPattern, with: "$1 $2", options: .regularExpression, range: nil)
      .replacingOccurrences(of: spacePattern, with: "$1 $2", options: .regularExpression, range: nil)
    
    result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
    return result
  }
  
    /// A computed property that converts camelCase strings to space-separated words.
  var toWords: String {
    camelCaseToWords()
  }
}
