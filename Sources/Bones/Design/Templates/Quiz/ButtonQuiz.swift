//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 08/01/2024.
//

import SwiftUI

public struct QuizButton: ButtonStyle {
  public enum ButtonStyle {
    case `default`
    case success
    case unSelectedSuccess
    case unSelected
    case failure
  }

  @Environment(\.isEnabled) private var isEnabled

  let style : ButtonStyle
  let isSelected: Bool
  let imageUrl: String?

  var backgroundColor: Color {
    get {
      switch style {
        case .success:
          return Color.bones.success
        case .unSelected, .unSelectedSuccess:
          return Color.bones.white
        case .failure:
          return Color.bones.failure
        case .default:
          return Color.bones.white
      }
    }
  }

  var foregroundColor: Color {
    get {
      switch style {
        case .success:
          return Color.bones.successForeground
        case .unSelected, .unSelectedSuccess:
          return Color.bones.textDark
        case .failure:
          return Color.bones.failureForeground
        case .default:
          return Color.bones.textDark
      }
    }
  }

  public init(style: ButtonStyle, isSelected: Bool, imageUrl: String?) {
    self.style = style
    self.isSelected = isSelected
    self.imageUrl = imageUrl
  }

  public func makeBody(configuration: Configuration) -> some View {
      getLabel(configuration: configuration, imageUrl: imageUrl)
        .cornerRadius(.bones(.medium))
        .foregroundColor(foregroundColor)
        .background(
          getOverlay(configuration: configuration)
        )
        .padding(.top, .bones(.medium))
        .overlay(alignment: .topTrailing) {
          switch style {
            case .success, .unSelectedSuccess:
              BonesIcon(icon: .bones(.checkmark), renderingMode: .template)
                .foregroundColor(.bones.grey6)
                .padding(8)
                .frame(width: 32, height: 32)
                .cornerRadius(.bones(.medium))
                .background(
                  RoundedRectangle(bonesRadius: .bones(.medium))
                  .fill(
                    Color.bones.success
                      .shadow(.bones.drop(.close))
                  )
                )
                .padding(.trailing, -8)
                .transition(
                  .movingParts.pop(Color.bones.primary)
                )
            default:
              EmptyView()
          }
        }
        .scaleEffect((style == .default && configuration.isPressed) ? 0.98 : 1)
        .animation(.default, value: configuration.isPressed)
        .changeEffect(
          .feedback(
            hapticImpact: .rigid
          ),
          value: configuration.isPressed
        )
  }

  private func getOverlay(configuration: Configuration) -> some View {
    switch style {
      case .failure, .success, .unSelected, .unSelectedSuccess:
        return RoundedRectangle(bonesRadius: .bones(.medium))
          .fill(
            backgroundColor
              .shadow(.bones.inner(.close))
          )

      default:
        return RoundedRectangle(bonesRadius: .bones(.medium))
          .fill(
            backgroundColor
              .shadow(
                isSelected
                ? .bones.inner(.close)
                : configuration.isPressed
                ? .bones.drop(.close)
                : .bones.drop(.far)
              )
          )
    }
  }

  private func getLabel(configuration: Configuration, imageUrl: String?) -> some View {
    HStack(alignment: .center, spacing: .bones(.medium)) {
      if let imageUrl {
        CachedAsyncImage(
          url: URL(string: imageUrl),
          transaction: .init(animation: .easeInOut(duration: 0.6))
        ) {
          phase in
          ZStack {
            Color.bones.white
            switch phase {
              case .success(let image):
                image
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .zIndex(1)
                  .transition(.movingParts.snapshot)
              case .failure(let error):
                Text(error.localizedDescription)
                  .font(.caption)
              case .empty:
                EmptyView()
              @unknown default:
                EmptyView()
            }
          }
          .frame(width: 24, height: 24)
          .aspectRatio(contentMode: .fill)
          .clipShape(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
          .background(
            RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
              .fill(Color.bones.grey3)
              .overlay(
                RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
                  .stroke(Color.bones.white, lineWidth: 2)
              )
          )
        }
      }
      configuration.label
        .font(.body)
        .dynamicTypeSize(...DynamicTypeSize.large)
        .multilineTextAlignment(.leading)
      Spacer()
    }
    .padding(.horizontal, .bones(.large))
    .padding(.vertical, .bones(.medium))
    .frame(maxWidth: .infinity)
  }
}


struct QuizButtonViewContainer: View {
  @State private var isDefaultButtonSelected: Bool = false
  @State private var isDefault2ButtonSelected: Bool = false
  @State private var isDefault3ButtonSelected: Bool = false
  @State private var isDefault4ButtonSelected: Bool = false
  @State private var isDefaultLongButtonSelected: Bool = false

  @State private var button1Style: QuizButton.ButtonStyle = .default
  @State private var button2Style: QuizButton.ButtonStyle = .default
  @State private var button3Style: QuizButton.ButtonStyle = .default
  @State private var button4Style: QuizButton.ButtonStyle = .default
  @State private var button5Style: QuizButton.ButtonStyle = .default

  var body: some View {
    List {
      Section {
        Button("Cody Fisher success") {
        }
        .buttonStyle(QuizButton(style: .success, isSelected: isDefaultButtonSelected, imageUrl: nil))
        .listRowBackground(Color.clear)

        Button("Cody Fisher success unselected") {
        }
        .buttonStyle(QuizButton(style: .unSelectedSuccess, isSelected: isDefaultButtonSelected, imageUrl: nil))
        .listRowBackground(Color.clear)


        Button("Cody Fisher failure") {
        }
        .buttonStyle(QuizButton(style: .failure, isSelected: isDefaultButtonSelected, imageUrl: nil))
        .listRowBackground(Color.clear)


        Button("Cody Fisher unselected") {
        }
        .buttonStyle(QuizButton(style: .unSelected, isSelected: isDefaultButtonSelected, imageUrl: nil))
        .listRowBackground(Color.clear)

      } header: {
        Text("Static composant")
      }

      Section {
        Button("Button will success") {
          isDefaultButtonSelected.toggle()
          if button1Style == .default {
            button1Style = .success
          } else {
            button1Style = .default
          }
        }
        .buttonStyle(QuizButton(style: button1Style, isSelected: isDefaultButtonSelected, imageUrl: nil))
        .animation(.default, value: button1Style)
        .listRowBackground(Color.clear)

        Button("Button will fail") {
          isDefault2ButtonSelected.toggle()
          if button2Style == .default {
            button2Style = .failure
          } else {
            button2Style = .default
          }
        }
        .buttonStyle(QuizButton(style: button2Style, isSelected: isDefault2ButtonSelected, imageUrl: nil))
        .animation(.default, value: button2Style)
        .listRowBackground(Color.clear)

        Button("Button will success unselected") {
          isDefault3ButtonSelected.toggle()
          if button3Style == .default {
            button3Style = .unSelectedSuccess
          } else {
            button3Style = .default
          }
        }
        .buttonStyle(QuizButton(style: button3Style, isSelected: isDefault3ButtonSelected, imageUrl: nil))
        .animation(.default, value: button3Style)
        .listRowBackground(Color.clear)

        Button("Button will unselected") {
          isDefault4ButtonSelected.toggle()
          if button4Style == .default {
            button4Style = .unSelected
          } else {
            button4Style = .default
          }
        }
        .buttonStyle(QuizButton(style: button4Style, isSelected: isDefault4ButtonSelected, imageUrl: nil))
        .animation(.default, value: button4Style)
        .listRowBackground(Color.clear)

        Button("Adipisicing sint non dolore eiusmod incididunt duis quis pariatur elit nisi pariatur. Adipisicing est culpa dolore incididunt sunt consectetur anim voluptate ut magna dolor et est sit irure. Consequat ullamco proident ea mollit. Esse reprehenderit veniam irure tempor consectetur exercitation laboris eiusmod nulla nulla officia reprehenderit minim. Elit ipsum cupidatat anim exercitation sunt ad deserunt reprehenderit fugiat et non velit ex dolor elit.") {
          isDefaultLongButtonSelected.toggle()

          if button5Style == .default {
            button5Style = .success
          } else {
            button5Style = .default
          }
        }
        .buttonStyle(QuizButton(style: button5Style, isSelected: isDefaultLongButtonSelected, imageUrl: nil))
        .animation(.default, value: button5Style)
        .listRowBackground(Color.clear)
      }
    header: {
      Text("Dynamic composant")
    }
    }
    .listStyle(.grouped)
    .listBackgroundColor()
    .navigationTitle("Button quiz")
  }
}


struct QuizButtonView_Previews: PreviewProvider {
  static var previews: some View {
    QuizButtonViewContainer()
  }
}
