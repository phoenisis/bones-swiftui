//
//  SocialTagSelectionButton.swift
//  
//
//  Created by Quentin PIDOUX on 08/02/2024.
//

import SwiftUI

struct BonesSocialTagSelectionButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  let availability: String?
  let remaining: String?
  let image: String?
  let description: String?
  let date: Date?
  let points: String?

  func makeBody(configuration: Configuration) -> some View {
    VStack(
      alignment: .leading,
      spacing: .bones(.medium)
    ) {
      HStack(
        alignment: .center,
        spacing: .bones(.medium)
      ) {
        if let availability {
          Text(availability)
            .font(.custom(.bones(.smallBold)))
        }
        if let remaining {
          TagView(remaining, icon: nil, style: .primary)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
      }

      HStack(
        alignment: .center,
        spacing: .bones(.medium)
      ) {
        BonesAvatarView(size: .xLarge, avatarType: .none, imageUrl: image, isFill: true)
        configuration.label
          .font(.custom(.bones(.bodyBold)))
      }

      if let description {
        Text(description)
          .font(.custom(.bones(.smallBold)))
      }

      HStack(alignment: .center, spacing: .bones(.medium)) {
        if let date {
          Text(date, style: .relative)
            .font(.custom(.bones(.small)))
        }
        if let points {
          Text(points)
            .bonesStyle(.points)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
      }
    }
    .padding(.bones(.large))
    .background(
      RoundedRectangle(
        bonesRadius: .bones(.large),
        style: .continuous
      )
      .fill(Color.bones.white)
      .shadow(
        radius: .bones(
          isEnabled
            ? configuration.isPressed ? .far.lowerShadow : .far
            : .none
        )
      )
    )
    .padding(.bones(.large))
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed && isEnabled
    )
    .animation(.default, value: configuration.isPressed && isEnabled)
    .changeEffect(
      .feedback(
        hapticImpact: .light
      ),
      value: configuration.isPressed && isEnabled
    )
  }
}

/// A preview struct to visualize the `BonesTextButton` button style in different states.
struct Preview_BonesSocialTagSelection: View {
  var body: some View {
    Section {
      Button("cillum non incididunt enim") {}
        .buttonStyle(.bones(.text(icon: .add)))
    } header: {
      Text("social tag")
        .font(.bones(.bodyBold))
        .foregroundStyle(Color.bones.textDark)
    }
  }
}

#Preview {
  List {
    Preview_BonesSocialTagSelection()
  }
  .listStyle(.grouped)
  .listBackgroundColor()
}
