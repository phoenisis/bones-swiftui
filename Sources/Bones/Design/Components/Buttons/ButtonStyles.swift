//
//  ButtonStyles.swift
//  
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

struct Preview_ButtonStyles: View {
  var body: some View {
    List {
      Preview_BonesChipButton()
      Preview_BonesButtonText()
      Preview_BonesButtonPlay()
      Preview_BonesSmallButton()
      Preview_BonesMediumButton()
      Preview_BonesLargeButton()
      Preview_BonesTrackerRoundButton()
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_ButtonStyles()
}
