//
//  TextStyles.swift
//  
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI

extension Text {
  public func bonesStyle(_ style: BonesTextStyles) -> some View {
    switch style {
      case .points:
        self.modifier(PointsViewModifier())
    }
  }
}


public enum BonesTextStyles {
  case points
}
