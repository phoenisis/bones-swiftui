//
//  Haptics.swift
//
//
//  Created by Quentin PIDOUX on 29/09/2023.
//

import UIKit

/// `Haptic` is a class responsible for managing and triggering haptic feedback on compatible devices.
public class Haptic {
  /// Generates impact feedback with the specified style, if `isTriggered` is `true`.
  /// - Parameters:
  ///   - feedbackStyle: The style of the impact feedback. A member of `UIImpactFeedbackGenerator.FeedbackStyle`.
  ///   - isTriggered: A Boolean that determines whether the haptic feedback is triggered. Defaults to `false`.
  public class func feedback(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle, _ isTriggered: Bool = false) {
    guard isTriggered else { return }

    DispatchQueue.main.async {
      UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
  }

  /// Generates notification feedback of the specified type.
  /// - Parameter feedbackType: The type of notification feedback. A member of `UINotificationFeedbackGenerator.FeedbackType`.
  public class func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
    DispatchQueue.main.async {
      UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
    }
  }
}
