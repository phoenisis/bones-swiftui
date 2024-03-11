//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 16/10/2023.
//

import Foundation

// MARK: Internal methods
extension String? {
  var localized: String? {
    guard let self else { return nil }
    return self.localized
  }
}

extension String {
  var localized: String {
    NSLocalizedString(self, comment: self)
  }
  /// Converts a camelCase string to a string with spaces between each word and the first letter of each word capitalized.
  /// - Returns: A string with spaces inserted between each word, following camelCase conventions, and the first letter capitalized.
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

  /// A computed property that converts a camelCase string to a string of words with the first letter of each word capitalized.
  /// - Returns: A string where camelCased words are separated by spaces and have their first letter capitalized.
	var toWords: String {
		camelCaseToWords()
	}
}
