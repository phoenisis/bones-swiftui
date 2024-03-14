//
//  PreviewProvider+Extensions.swift
//  
//
//  Created by Quentin PIDOUX on 14/03/2024.
//

import SwiftUI

extension PreviewProvider {
  
  @ViewBuilder static var headerPlaceholder: some View {
    Text("Header\ncontent")
      .textColor(.bones.primary)
      .frame(maxWidth: .infinity)
      .padding(.bones(.medium))
      .background(Color.bones.grey3)
      .border(Color.bones.primary, width: .hairline)
      .opacity(0.3)
  }
  
  @ViewBuilder static var illustrationPlaceholder: some View {
    Text("Illustration\ncontent")
      .padding(.vertical, .bones(.medium))
      .frame(minWidth: 100, maxWidth: 300, maxHeight: 200)
      .background(Color.bones.secondary)
      .border(Color.bones.secondary, width: .hairline)
      .opacity(0.3)
  }
  
  @ViewBuilder static var contentPlaceholder: some View {
    Text("Custom\nContent")
      .textColor(.bones.textDark)
      .padding(.bones(.medium))
      .frame(maxWidth: .infinity)
      .background(Color.bones.textDark)
      .border(Color.bones.textDark, width: .hairline)
      .opacity(0.3)
  }
  
  @ViewBuilder static var footerPlaceholder: some View {
    Text("Custom\nFooter")
      .textColor(.bones.textDark)
      .padding(.bones(.medium))
      .frame(maxWidth: .infinity)
      .background(Color.bones.textDark)
      .border(Color.bones.textDark, width: .hairline)
      .opacity(0.3)
  }
  
  @ViewBuilder static var intrinsicContentPlaceholder: some View {
    Text("Content")
      .textColor(.bones.textDark)
      .padding(.bones(.medium))
      .background(Color.bones.textDark)
      .border(Color.bones.textDark, width: .hairline)
      .opacity(0.3)
  }
}
