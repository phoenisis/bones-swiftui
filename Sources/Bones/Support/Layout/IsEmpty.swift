//
//  IsEmpty.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

extension View {

  var isEmpty: Bool {
    switch self {
      case is EmptyView:                      return true
      case let view as PotentiallyEmptyView:  return view.isEmpty
      default:                                return false
    }
  }
}
