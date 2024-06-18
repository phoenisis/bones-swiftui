//
//  HapticsProvider.swift
//
//
//  Created by Quentin PIDOUX on 13/03/2024.
//

import SwiftUI
#if canImport(UIKit)
  import UIKit
#endif

/// A utility to provide haptic feedback in iOS applications.
public enum HapticsProvider {
  /// The types of haptic feedback that can be generated.
  public enum HapticFeedbackType {
    case selection
    case light(_ intensity: CGFloat = 1.0)
    case medium(_ intensity: CGFloat = 1.0)
    case heavy(_ intensity: CGFloat = 1.0)
    case notification(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType)
  }
  
  @MainActor private static let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
  @MainActor private static let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
  @MainActor private static let heavyImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
  @MainActor private static let mediumImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
  @MainActor private static let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
  
  /// Prepares the specified type of haptic feedback generator for use.
  @MainActor
  public static func prepareHapticFeedbackGenerator(_ type: HapticFeedbackType) {
    switch type {
      case .selection: selectionFeedbackGenerator.prepare()
      case .light: lightImpactFeedbackGenerator.prepare()
      case .medium: mediumImpactFeedbackGenerator.prepare()
      case .heavy: heavyImpactFeedbackGenerator.prepare()
      case .notification: notificationFeedbackGenerator.prepare()
    }
  }
  
  /// Triggers the specified type of haptic feedback.
  @MainActor
  public static func sendHapticFeedback(_ type: HapticFeedbackType) {
    prepareHapticFeedbackGenerator(type)
    
    switch type {
      case .selection:
        selectionFeedbackGenerator.selectionChanged()
      case .light(let intensity):
        lightImpactFeedbackGenerator.impactOccurred(intensity: intensity)
      case .medium(let intensity):
        mediumImpactFeedbackGenerator.impactOccurred(intensity: intensity)
      case .heavy(let intensity):
        heavyImpactFeedbackGenerator.impactOccurred(intensity: intensity)
      case .notification(let feedbackType):
        notificationFeedbackGenerator.notificationOccurred(feedbackType)
    }
  }
}
