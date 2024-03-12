//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 12/03/2024.
//

import Foundation

var bonesRadius: [CGFloat.BonesSpacing: CGFloat] = [:]

public enum BonesRadius { case bones(CGFloat.BonesRadius) }

extension CGFloat {
  public enum BonesRadius: CGFloat, CaseIterable, Identifiable {
    case none
    case small
    case medium
    case large
    
    public var rawValue: CGFloat {
      switch self {
        case .none: return bonesSpacings[.none] ?? 0
        case .small:  return bonesSpacings[.small] ?? 4
        case .medium: return bonesSpacings[.medium] ?? 8
        case .large: return bonesSpacings[.large] ?? 16
      }
    }
    
    public var id: String {
      switch self {
        case .none: return "none"
        case .small:  return "small"
        case .medium: return "medium"
        case .large: return "large"
      }
    }
  }
}
