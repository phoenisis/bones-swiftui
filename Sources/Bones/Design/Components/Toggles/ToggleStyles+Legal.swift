//
//  ToggleStyles+Legal.swift
//  
//
//  Created by Quentin PIDOUX on 09/11/2023.
//

import SwiftUI

/// A custom `ToggleStyle` for consent forms in the application.
struct ConsentToggleStyle: ToggleStyle {
  /// Color for the toggle when it is in the "on" state.
  let onColor: Color = Color.bones.primary
  /// Color for the toggle when it is in the "off" state.
  let offColor: Color = Color.bones.grey3

  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
        .font(.custom(.bones(.small)))
      Spacer()
      Capsule()
        .foregroundColor(configuration.isOn ? onColor : offColor)
        .frame(width: 51, height: 31, alignment: .center)
        .overlay(
          Circle()
            .foregroundColor(.white)
            .padding(.all, 3)
            .overlay(
              Image(systemName: configuration.isOn ? "checkmark" : "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(Font.title.weight(.black))
                .frame(width: 8, height: 8, alignment: .center)
                .foregroundColor(configuration.isOn ? onColor : offColor)
                .animation(Animation.easeInOut(duration: 0.1), value: configuration.isOn)

            )
            .offset(x: configuration.isOn ? 11 : -11, y: 0)
            .shadow(radius: .bones(.close))
            .animation(Animation.easeInOut(duration: 0.1), value: configuration.isOn)
        )
        .onTapGesture { configuration.isOn.toggle() }
    }
    .frame(maxWidth: .infinity, minHeight: 54, alignment: .leading)
  }
}

struct Preview_ConsentToggleStyle: View {
  @State var isOn: Bool = false

  var body: some View {
    List {
      Toggle("Toggle", isOn: $isOn)
        .toggleStyle(.bones(.legal))

      Toggle("Lock on", isOn: .constant(true))
        .toggleStyle(.bones(.legal))
      Toggle("Lock off", isOn: .constant(false))
        .toggleStyle(.bones(.legal))
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_ConsentToggleStyle()
}
