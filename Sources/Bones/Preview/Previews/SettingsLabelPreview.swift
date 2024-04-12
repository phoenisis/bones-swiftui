//
//  SettingsLabelPreview.swift
//
//
//  Created by Quentin PIDOUX on 07/12/2023.
//

import SwiftUI

#Preview {
  List {
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsLabelStyle(.primary))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsLabelStyle(.secondary))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsLabelStyle(.danger))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsLabelStyle(.custom(background: .bones.primary, foreground: .bones.primaryForeground)))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsLabelStyle(.primary, trailingIcon: .arrowRight))
    Label("Label", systemImage: "person.crop.circle.fill")
      .labelStyle(BonesSettingsLabelStyle(.primary, trailingContent: {
        Text("Hello")
      }))
  }
}
