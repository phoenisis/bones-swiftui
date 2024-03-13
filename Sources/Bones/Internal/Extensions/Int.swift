//
//  Int.swift
//  
//
//  Created by Quentin PIDOUX on 17/10/2023.
//

import Foundation

extension Int {
  /// Formats the integer into a string with considerations for larger numbers.
  /// - Parameter showZero: A boolean to decide whether to show zero in the string.
  /// - Returns: A formatted string. For numbers 1000 and above, it shows the number in thousands followed by "k".
  /// If `showZero` is false and the number is zero, an empty string is returned.
	func thousandLimitNumber(showZero: Bool) -> String {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .decimal
		numberFormatter.maximumFractionDigits = 2

		if self >= 1000 {
			return numberFormatter.string(from: NSNumber(value: self / 1000))! + "k"
		} else {
			guard showZero && self != 0 else { return "" }
			return numberFormatter.string(from: NSNumber(value: self)) ?? ""
		}
	}

  /// Formats the integer into a string with abbreviated styles for larger numbers.
  /// - Returns: A string representing the integer.
  /// For numbers 1000 and above, the number is divided by 1000 and appended with "k".
	func formatLargeNumber() -> String {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .decimal
		numberFormatter.maximumFractionDigits = 1

		if self >= 1000 {
			return numberFormatter.string(from: NSNumber(value: self / 1000))! + "k"
		} else {
			return numberFormatter.string(from: NSNumber(value: self))!
		}
	}
}
