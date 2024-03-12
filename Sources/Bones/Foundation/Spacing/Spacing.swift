//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 12/03/2024.
//

import Foundation

var bonesSpacings: [CGFloat.BonesSpacing: CGFloat] = [:]

public enum BonesSpacing { case bones(CGFloat.BonesSpacing) }

extension CGFloat {
  public enum BonesSpacing: CGFloat, CaseIterable, Identifiable {
    case none
    case small
    case medium
    case xMedium
    case large
    case xLarge
    
    public var rawValue: CGFloat {
      switch self {
        case .none: return bonesSpacings[.none] ?? 0
        case .small:  return bonesSpacings[.small] ?? 4
        case .medium: return bonesSpacings[.medium] ?? 16
        case .xMedium: return bonesSpacings[.xMedium] ?? 24
        case .large: return bonesSpacings[.large] ?? 32
        case .xLarge: return bonesSpacings[.xLarge] ?? 64
      }
    }
    
    public var id: String {
      switch self {
        case .none: return "none"
        case .small:  return "small"
        case .medium: return "medium"
        case .xMedium: return "xMedium"
        case .large: return "large"
        case .xLarge: return "xLarge"
      }
    }
  }
}
