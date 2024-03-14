//
//  BoostButton.swift
//
//
//  Created by Quentin PIDOUX on 30/01/2024.
//

import AVKit
import SwiftUI

struct BonesBoostButton: ButtonStyle {

  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

  var startDate: Date?
  var endDate: Date?

  var totalDuration: String? {
    guard let startDate,
          let endDate
    else { return nil }

    return Duration.seconds(endDate.timeIntervalSince(startDate)).formatted(.units(allowed: [.hours], zeroValueUnits: .hide))
  }

  @State var audioPlayer: AVAudioPlayer!
  @State private var isEnabled: Bool = true
  @State private var remainingDuration: String?
  @State private var progress: CGFloat = 0
  @State private var remainingInterval: TimeInterval?
  @State private var bounceCount: Int = 0
  @State private var shakeCount: Int = 0
  @State private var flipCount: Int = 0
  @State private var boltCount: Int = 0
  @State private var bounceHeight: CGFloat = 100

  func computeRemainingDuration() {

    guard let startDate,
          let endDate
    else {
      isEnabled = true
      return
    }

    let intervalSinceStart = Date().timeIntervalSince(startDate)

    remainingInterval = endDate.timeIntervalSince(startDate) - intervalSinceStart
    guard let remainingInterval
    else {
      remainingDuration = nil
      progress = 0
      isEnabled = true
      return
    }
    isEnabled = false
    if remainingInterval < 0 {
      remainingDuration = nil
      progress = 0
      isEnabled = true
      return
    }

    remainingDuration = Duration
      .UnitsFormatStyle(
        allowedUnits: [.hours, .minutes, .seconds],
        width: .narrow
      )
      .format(
        .seconds(remainingInterval)
      )


    let total = endDate.timeIntervalSince(startDate)
    let current = Date().timeIntervalSince(startDate)
    progress = CGFloat(current / total)
    if remainingInterval <= 11 {
      bounceCount += 1
      bounceHeight = {
        if remainingInterval < 11 && remainingInterval > 10 {
          audioPlayer.play()
        }
        if remainingInterval < 1 {
          shakeCount += 1
          flipCount += 1
          return 320
        } else if remainingInterval < 2 {
          shakeCount += 1
          boltCount += 1
          return 60
        } else if remainingInterval < 3 {
          boltCount += 1
          return 30
        } else if remainingInterval < 4 {
          boltCount += 1
          return 15
        } else if remainingInterval < 5 {
          boltCount += 1
          return 7
        } else { return 0 }
      }()
    }
  }

  public init(startDate: Date?, endDate: Date?) {
    self.startDate = startDate
    self.endDate = endDate
    computeRemainingDuration()
  }

  // swiftlint:disable:next function_body_length
  func makeBody(configuration: Configuration) -> some View {
    VStack(
      alignment: .center,
      spacing: 0
    ) {
      if let remainingDuration,
         let totalDuration {
        VStack(
          alignment: .center,
          spacing: .bones(.large)
        ) {
          HStack {
            Text("Temps restant")
              .foregroundStyle(Color.bones.primary)
            Text("\(remainingDuration)/\(totalDuration)")
              .frame(maxWidth: .infinity, alignment: .leading)
              .animation(.default, value: remainingDuration)
              .changeEffect(
                .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
                  Image("boost", bundle: .module)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .colorMultiply(Color.bones.primary)

                }, value: boltCount)
          }
          .font(.custom(.bones(.bodyBold)))
          .monospacedDigit()
          .contentTransition(.numericText())

          ProgressView(value: progress)
            .tint(Color.bones.primary)
            .padding(.bottom, .bones(.medium))
        }
        .padding(.bones(.large))
        .background(
          RoundedRectangle(bonesRadius: .bones(.large), style: .continuous)
            .fill(Color.bones.white)
            .shadow(
              radius: .bones(.close)
            )
        )
        .padding(.horizontal, .bones(.large))
        .padding(.horizontal, .bones(.large))
        .padding(.bottom, -8)
        .changeEffect(
          .jump(height: bounceHeight),
          value: bounceCount
        )
        .changeEffect(.shake(rate: .fast), value: shakeCount)
        .changeEffect(.spin, value: flipCount)
        .changeEffect(
          .feedback(
            hapticImpact: .rigid
          ),
          value: bounceCount
        )
        .changeEffect(
          .feedback(
            hapticNotification: .success
          ),
          value: flipCount
        )
        .transition(
          .asymmetric(
            insertion: .movingParts.move(
              angle: .degrees(270)
            ),
            removal: .movingParts.move(
              angle: .degrees(270)
            )
          ).combined(with: .opacity)
        )
        .onDisappear {
          audioPlayer.pause()
        }
      }
      configuration.label
        .font(.bones(.bodyBold))
        .minimumScaleFactor(0.5)
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bones(.large))
        .background(
          isEnabled 
            ? Color.bones.primary
            : Color.bones.grey3
        )
        .foregroundStyle(
          isEnabled
            ? Color.bones.primaryForeground
            : Color.bones.textDark
        )
        .cornerRadius(.bones(.large))
        .shadow(
          radius: isEnabled 
            ? configuration.isPressed ? .bones(.close) : .bones(.far)
            : .bones(.none)
        )
        .conditionalEffect(
          .pushDown,
          condition: configuration.isPressed && isEnabled
        )
    }
    .animation(.default, value: remainingInterval)
    .onAppear {
      computeRemainingDuration()
      let sound = Bundle.module.path(forResource: "countDown", ofType: "wav")
      // swiftlint:disable:next force_try
      self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))

    }
    .onReceive(timer) { time in
      computeRemainingDuration()
      if remainingInterval ?? 0 < 0 {
        timer.upstream.connect().cancel()
      }
    }
    .animation(.default, value: configuration.isPressed)
    .changeEffect(
      .feedback(
        hapticImpact: .light
      ),
      value: configuration.isPressed && isEnabled
    )
    .padding(.horizontal, .bones(.large))
  }
}

struct Preview_BonesBoostButton: View {
  @State var startDate: Date?
  @State var endDate: Date?

  let buttonTitle: String = "Boost un coéquipier"

  func doSomeAction() {
    startDate = Date().addingTimeInterval(-106_500)
    endDate = Date().addingTimeInterval(+015)
  }


  var body: some View {
    List {
      EmptyListContentView(image: .bolt, title: "boost button", description: nil, buttonTitle: nil, buttonDidTap: {})
    }
    .listStyle(.grouped)
    .listBackgroundColor()
    .safeAreaInset(edge: .bottom) {
      Button(buttonTitle) {
        doSomeAction()
      }
      .buttonStyle(
        .bones(
          .boost(startAt: startDate, endAt: endDate)
        )
      )
    }
  }
}

#Preview {
  Preview_BonesBoostButton()
}
