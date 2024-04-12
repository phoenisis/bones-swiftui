//
//  SocialTagCardView.swift
//
//
//  Created by Quentin PIDOUX on 18/12/2023.
//

import SwiftUI

public struct SocialTagCardView: ButtonStyle {
  public struct Tag {
    let title: String
    let image: String?
    let icon: Image.BonesImage?

    public init(title: String, image: String?, icon: Image.BonesImage?) {
      self.title = title
      self.image = image
      self.icon = icon
    }
  }

  public struct ProgressType {
    let minDate: Date?
    let maxDate: Date?

    var remaining: String?
    var finalDuration: String?

    var remainingPercentage: Float? {
      guard let minDate, let maxDate else { return nil }
      let totalDuration = maxDate.timeIntervalSince(minDate)
      let remainingDuration = -minDate.timeIntervalSinceNow
      let percent = Float(remainingDuration / totalDuration)
      guard percent < 1 else { return 1 }
      return percent
    }

    public init(minDate: Date?, maxDate: Date?) {
      self.minDate = minDate
      self.maxDate = maxDate

      if let maxDate {
        remaining = Duration
          .UnitsFormatStyle(
            allowedUnits: [.hours, .minutes, .seconds],
            width: .abbreviated
          ).format(
            Duration.seconds(maxDate.timeIntervalSinceNow)
          )
      }

      if let minDate, let maxDate {
        finalDuration = Duration
          .UnitsFormatStyle(
            allowedUnits: [.hours, .minutes, .seconds],
            width: .abbreviated
          ).format(
            Duration.seconds(maxDate.timeIntervalSince(minDate))
          )
      }
    }

    var durationTotal: Duration? {
      guard let minDate, let maxDate else { return nil }
      return Duration.seconds(maxDate.timeIntervalSince(minDate))
    }

    mutating func updateRemaining() {
      guard let maxDate, let minDate else { return }

      guard Date.now.timeIntervalSince(minDate) <= maxDate.timeIntervalSince(minDate)+1 else { return }

      remaining =
        Duration.seconds(-minDate.timeIntervalSinceNow).formatted(.time(pattern: .hourMinuteSecond))
//        Duration
//          .UnitsFormatStyle(
//            allowedUnits: [.hours, .minutes, .seconds],
//            width: .condensedAbbreviated,
//            zeroValueUnits: .show(length: 2)
//          ).format(
//            Duration.seconds(-minDate.timeIntervalSinceNow)
//          )

    }
  }

  @Environment(\.isEnabled) private var isEnabled
  let imageUrl: String?
  let progress: Double?
  let tags: [Tag]

  let occurrence: String?
  let description: String?
  let points: String?
  let isExpandable: Bool
  let isExpanded: Bool
  let isClickable: Bool

  @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  @State var progressType: ProgressType?

  var didButtonTap: () -> Void

  init(imageUrl: String?, description: String?, occurrence: String?,  points: String?, progress: Double?, tags: [Tag], progressType: ProgressType?, isExpandable: Bool, isExpanded: Bool, isClickable: Bool, didButtonTap: @escaping () -> Void = {}) {
    self.imageUrl = imageUrl
    self.description = description
    self.occurrence = occurrence
    self.progress = progress
    self.tags = tags
    self.isExpandable = isExpandable
    self.isExpanded = isExpanded
    self.isClickable = isClickable
    self.points = points
    self.didButtonTap = didButtonTap
    self.progressType = progressType

  }

  // swiftlint:disable:next function_body_length
  public func makeBody(configuration: Configuration) -> some View {
    VStack(alignment: .leading, spacing: .bones(.large)) {
      if tags.isEmpty == false || isEnabled == false {
        HStack(
          alignment: .center,
          spacing: .bones(.large),
          content: {
            HStack(
              alignment: .center,
              spacing: .bones(.large),
              content: {
                ForEach(tags, id: \.title) { tag in
                  TagView(tag.title, icon: tag.icon, iconUrl: tag.image, style: .default)
                }
              }
            )
            .frame(maxWidth: .infinity, alignment: .leading)

            if isEnabled == false {
              BonesIcon(icon: .bones(.lock), renderingMode: .template)
                .frame(width: 24, height: 24)
            }
          }
        )
      }

      HStack(
        alignment: .center,
        spacing: .bones(.large),
        content: {
          BonesAvatarView(
            size: .xLarge,
            avatarType: .none,
            imageUrl: imageUrl
          )
          configuration.label
            .font(.custom(.bones(.bodyBold)))
            .multilineTextAlignment(.leading)
        }
      )

      VStack(
        alignment: .leading,
        spacing: .bones(.large),
        content: {
          if let progressType {
            HStack(
              alignment: .center,
              spacing: .bones(.small),
              content: {
                if let remaining = progressType.remaining,
                   let finalDuration = progressType.finalDuration {
                  HStack(spacing: 8) {
                    Text(remaining)
                      .foregroundColor(Color.bones.primary)
                    Text("/")
                    Text(finalDuration)
                  }
                  .font(.custom(.bones(.bodyBold)))
                  .monospacedDigit()
                  .onReceive(timer) { _ in
                    if progressType.remainingPercentage == 1 {
                      timer.upstream.connect().cancel()
                    }
                    self.progressType?.updateRemaining()
                  }
                  .onDisappear {  self.progressType?.updateRemaining()  }
                }  else {
                  Text("12 H 30 MIN 43 SEC")
                    .foregroundColor(Color.bones.primary)
                  Text("/")
                  Text("24h")
                }
              }
            )
            .font(.custom(.bones(.bodyBold)))

            ProgressView(value: progressType.remainingPercentage)
              .progressViewStyle(.linear)
              .scaleEffect(x: 1, y: 3, anchor: .center)
              .tint(Color.bones.primary)
          }
          if let progress {
            ProgressView(value: progress)
              .progressViewStyle(.linear)
              //              .frame(maxWidth: .infinity, alignment: .leading)
              .scaleEffect(x: 1, y: 3, anchor: .center)
              .tint(Color.bones.primary)
          }

          if isExpanded && isExpandable {
            VStack(alignment: .leading, spacing: .bones(.large), content: {
              HStack(alignment: .center, spacing: .bones(.medium), content: {
                TagView(occurrence, icon: .clock, iconUrl: nil, style: .default)
                Spacer()
                if let points {
                  Text(points)
                    .font(.custom(.bones(.bodyBold)))
                    .padding(.bones(.large))
                    .background(
                      BonesPointsShape()
                        .fill(Color.bones.primary)
                    )
                    .foregroundStyle(Color.bones.primaryForeground)
                    .padding(.trailing, -8)
                }
              })
              .frame(maxWidth: .infinity, alignment: .leading)
              if let description {
                Text(description)
                  .font(.custom(.bones(.body)))
              }

              Button("praticipate") { didButtonTap() }
                .buttonStyle(.bones(.navigation))

            })
//            .transition(
//              AnyTransition
//                .asymmetric(
//                  insertion: .movingParts.blur(radius: 4),
//                  removal: .identity
//                    .combined(with:
//                        .opacity
//                      .animation(.easeIn(duration: 0.1))
//                    )
//                )
//            )
            .transition(
              AnyTransition
                .asymmetric(
                  insertion: .movingParts.pop(Color.bones.primary).combined(with: .opacity ),
                  removal: .identity
                    .combined(with:
                      .movingParts.pop
                    )
                )
            )
          }
        }
      )
      if isExpandable {
        HStack(alignment: .center, content: {
          BonesIcon(icon: .bones(.chevronDownCompact), renderingMode: .template)
            .frame(width: 16, height: 16)
            .rotationEffect(.degrees(isExpanded ? 180 : 0))
        })
        .frame(maxWidth: .infinity, alignment: .center)
      }
    }
    .transition(
      .opacity
    )
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.bones(.large))
    .background(
      RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        .fill(
          Color.bones.white
            .shadow(
              .bones.drop(
                isEnabled
                  ? isClickable ? .close : .none
                  : .none
              )
            )
        )
    )
    .opacity(isEnabled ? 1 : 0.3)
    .padding(.horizontal, (isExpanded && isExpandable) ? 0 : 16)
    .animation(.easeInOut(duration: 0.6), value: isExpanded)
    .changeEffect(
      .feedback(
        hapticImpact: .light
      ),
      value: configuration.isPressed
    )
  }
}


struct Preview_SocialTagCardView: View {
  @State private var progress = 0.0
  @State private var isExpanded = false

  var body: some View {
    List {
      Button("Duis ea quis pariatur.") {
        //        progress += 0.05
        isExpanded.toggle()
      }
      .buttonStyle(
        SocialTagCardView(
          imageUrl: "https://picsum.photos/300", 
          description: "Non elit ipsum dolor ad culpa occaecat. Non elit ipsum dolor ad culpa occaecat. Non elit ipsum dolor ad culpa occaecat. Non elit ipsum dolor ad culpa occaecat. Non elit ipsum dolor ad culpa occaecat. Non elit ipsum dolor ad culpa occaecat. Non elit ipsum dolor ad culpa occaecat. Non elit ipsum dolor ad culpa occaecat", 
          occurrence: "daily",
          points: "125 pts",
          progress: progress,
          tags: [
            .init(title: "social tag", image: nil, icon: .camera),
            .init(title: "1 dispo", image: nil, icon: nil)
          ],
          progressType: .init(
            minDate: Date(timeIntervalSinceNow: -60  * 0.5 * 1),
            maxDate: Date(timeIntervalSinceNow: 60  * 0.5 * 1)
          ),
          isExpandable: true,
          isExpanded: isExpanded, 
          isClickable: true,
          didButtonTap: {
            progress += 0.05
          }
        )
      )
      .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)

      Button("Duis ea quis pariatur.Quis aute esse eiusmod voluptate veniam excepteur dolor sunt est irure officia amet. Adipisicing dolore deserunt anim exercitation eiusmod duis adipisicing. Laborum adipisicing fugiat eiusmod do. Mollit velit et in amet ipsum aute fugiat eu aute do labore ut. Dolor nisi occaecat voluptate Lorem. Eiusmod ad aute aliquip consequat anim amet nulla et ad officia dolore. Ex laboris cillum reprehenderit. Cillum dolor anim sit do tempor cupidatat tempor cupidatat officia aliquip est culpa.") {
        progress += 0.05
      }
      .buttonStyle(
        SocialTagCardView(
          imageUrl: "https://picsum.photos/300",
          description: nil, 
          occurrence: nil,
          points: nil,
          progress: progress,
          tags: [], 
          progressType: nil,
          isExpandable: false,
          isExpanded: false, 
          isClickable: false,
          didButtonTap: {}
        )
      )
      .disabled(true)
      .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)
    }
    .listStyle(.grouped)
    .listRowSpacing(16)
    .listBackgroundColor()
  }
}

#Preview {
  Preview_SocialTagCardView()
}
