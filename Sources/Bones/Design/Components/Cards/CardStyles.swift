//
//  CardStyles.swift
//  
//
//  Created by Quentin PIDOUX on 30/10/2023.
//

import SwiftUI

struct Preview_CardStyles: View {
  var body: some View {
    List {
      Preview_CardMobility()
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_CardStyles()
}
