//
//  TeamMemberView.swift
//  
//
//  Created by Quentin PIDOUX on 29/01/2024.
//

import SwiftUI

public struct TeamMemberView: View {
  let name: String
  let entityName: String?
  let points: String?
  let imageUrl: String?
  let isCaptain: Bool
  let isDeleted: Bool
  let boostCount: Int
  let boostCapacity: Int
  let shouldBoltAnimate: Bool
  let didTap: () -> Void

  public init(
    name: String,
    entityName: String?,
    points: String?,
    imageUrl: String?,
    isCaptain: Bool,
    isDeleted: Bool,
    boostCount: Int,
    boostCapacity: Int,
    shouldBoltAnimate: Bool,
    didTap: @escaping () -> Void
  ) {
    self.name = name
    self.entityName = entityName
    self.points = points
    self.imageUrl = imageUrl
    self.isCaptain = isCaptain
    self.isDeleted = isDeleted
    self.boostCount = boostCount
    self.boostCapacity = boostCapacity
    self.shouldBoltAnimate = shouldBoltAnimate
    self.didTap = didTap
  }

  public var body: some View {
    Button(name) { didTap() }
      .buttonStyle(
        TeamMemberViewButtonStyle(
          entityName: entityName,
          points: points,
          imageUrl: imageUrl,
          isCaptain: isCaptain,
          isDeleted: isDeleted,
          boostCount: boostCount,
          boostCapacity: boostCapacity,
          shouldBoltAnimate: shouldBoltAnimate,
          didTap: didTap
        )
      )
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)
  }
}

struct TeamMemberViewButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let entityName: String?
  let points: String?
  let imageUrl: String?
  let isCaptain: Bool
  let isDeleted: Bool
  let boostCount: Int
  let boostCapacity: Int
  let shouldBoltAnimate: Bool
  let didTap: () -> Void

  @State private var boltAnimationCount: Int = 0

  func makeBody(configuration: Configuration) -> some View {
    HStack(
      alignment: .center,
      spacing: .bones(.medium),
      content: {
        BonesAvatarView(size: .teamMember, avatarType: isDeleted ?  .userDeleted : .user, imageUrl: imageUrl)
          .overlay(alignment: .topLeading) {
            Image("captain", bundle: .module)
              .colorMultiply(Color.bones.primary)
              .padding(.bones(.medium))
              .background(
                Circle()
                  .fill(Color.bones.white)
                  .shadow(radius: .bones(.close))
              )
              .padding(.leading, -8)
              .padding(.top, -8)
              .opacity(isCaptain ? 1 : 0)
          }
        VStack(
          alignment: .leading,
          spacing: 0,
          content: {
            configuration.label
              .font(.custom(.bones(.bodyBold)))
              .multilineTextAlignment(.leading)
              .frame(maxHeight: .infinity)
            if let entityName {
              Text(entityName)
                .font(.custom(.bones(.body)))
                .multilineTextAlignment(.leading)
                .frame(maxHeight: .infinity)
            }
            if let points {
              Text(points)
                .font(.custom(.bones(.body)))
                .multilineTextAlignment(.leading)
                .frame(maxHeight: .infinity)
            }
          }
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        HStack(
          alignment: .center,
          spacing: 0,
          content: {
            if boostCapacity > 0 {
              Image("boost", bundle: .module)
                .colorMultiply(Color.bones.primary)
                .opacity(boostCount > 0 ? 1 : 0.3)
            }
            if boostCapacity > 1 {
              Image("boost", bundle: .module)
                .colorMultiply(Color.bones.primary)
                .opacity(boostCount > 1 ? 1 : 0.3)
            }
            if boostCapacity > 2 {
              Image("boost", bundle: .module)
                .colorMultiply(Color.bones.primary)
                .opacity(boostCount > 2 ? 1 : 0.3)
            }
            if boostCapacity > 3 || boostCapacity < 0 {
              Text("x\(boostCapacity)")
                .font(.custom(.bones(.body)))
            }
          }
        )
        .changeEffect(
          .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
            Image("boost", bundle: .module)
              .resizable()
              .frame(width: 42, height: 42)
              .colorMultiply(Color.bones.primary)

          }, value: boltAnimationCount)
      }
    )
    .frame(maxWidth: .infinity, alignment: .leading)
    .animation(.default, value: configuration.isPressed)
    .onChange(of: shouldBoltAnimate) { _, shouldBoltAnimate in
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        if shouldBoltAnimate {
          boltAnimationCount+=1
        }
      }
    }
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed
    )
  }
}

struct Preview_TeamMemberView: View {
  @State private var shouldAnimate: Bool = false

  var body: some View {
    List {
      TeamMemberView(
        name: "Nom du membre",
        entityName: "Nom Pôle",
        points: "1 000 pts",
        imageUrl: "https://picsum.photos/50",
        isCaptain: true,
        isDeleted: false,
        boostCount: 1,
        boostCapacity: 200,
        shouldBoltAnimate: false,
        didTap: {}
      )
      TeamMemberView(
        name: "Nom du membre",
        entityName: nil,
        points: "1 000 pts",
        imageUrl: "https://picsum.photos/50",
        isCaptain: false,
        isDeleted: false,
        boostCount: 2,
        boostCapacity: 200,
        shouldBoltAnimate: shouldAnimate,
        didTap: {}
      )
      TeamMemberView(
        name: "Nom du membre",
        entityName: nil,
        points: nil,
        imageUrl: nil,
        isCaptain: true,
        isDeleted: true,
        boostCount: 4,
        boostCapacity: 200,
        shouldBoltAnimate: false,
        didTap: {}
      )

      TeamMemberView(
        name: "Nom du membre",
        entityName: nil,
        points: nil,
        imageUrl: "https://picsum.photos/50",
        isCaptain: true,
        isDeleted: false,
        boostCount: 1,
        boostCapacity: 2,
        shouldBoltAnimate: false,
        didTap: {}
      )
    }
    .listStyle(.plain)
    .listRowSpacing(16)
    .listBackgroundColor()
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        shouldAnimate = true
      }
    }
  }
}

#Preview {
  Preview_TeamMemberView()
}
