//
//  TextFields.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

public extension TextFieldStyle where Self == BonesDefaultTextFieldStyle {
  static var bones: Self { .init() }
}

public extension TextFieldStyle where Self == BonesSearchTextFieldStyle {
  static var bonesSearch: Self { .init() }
}

public extension TextFieldStyle where Self == BonesSecureTextFieldStyle {
  static func bonesSecure(_ isProtected: Bool, _ securityChanged: @escaping () -> Void) -> Self {
    .init(isProtected: isProtected, securityChanged: securityChanged)
  }
}
