//
//  List+EmptyContent.swift
//  
//
//  Created by Quentin PIDOUX on 30/11/2023.
//

import SwiftUI

public struct BonesEmptyListContentView: View {
  let image: Image.BonesImage?
  let title: LocalizedStringKey
  let description: LocalizedStringKey?
  let buttonTitle: LocalizedStringKey?
  
  let buttonDidTap: (() -> Void)?
  
  public init(image: Image.BonesImage?, title: LocalizedStringKey, description: LocalizedStringKey?, buttonTitle: LocalizedStringKey?, buttonDidTap: ( () -> Void)?) {
    self.image = image
    self.title = title
    self.description = description
    self.buttonTitle = buttonTitle
    self.buttonDidTap = buttonDidTap
  }
  
  fileprivate func emptyContent() -> some View {
    VStack(
      alignment: .center,
      spacing: .bones(.large)
    ) {
      if let image {
        BonesIcon(icon: .bones(image), fontWeight: .medium, renderingMode: .template)
          .frame(width: 48, height: 48)
      }
      Text(title)
        .font(.custom(.bones(.h3)))
        .multilineTextAlignment(.center)
      if let description {
        Text(description)
          .font(.custom(.bones(.body)))
          .multilineTextAlignment(.center)
      }
      
      if let buttonTitle {
        Button(buttonTitle) {
          buttonDidTap?()
        }
        .buttonStyle(.bones(.medium(.fill(icon: nil))))
      }
    }
  }
  
  public var body: some View {
    ContentUnavailableView {
      emptyContent()
    }
  }
}
