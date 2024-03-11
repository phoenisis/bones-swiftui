//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 28/11/2023.
//

import SwiftUI

public extension View {
  @ViewBuilder
  func shine(_ toggle: Bool, duration: CGFloat = 0.8, clipShape: some Shape = .rect) -> some View {
    if #available(iOS 17, *) {
      self
        .overlay {
          GeometryReader {
            let size = $0.size
            let moddedDuration = max(0.3, duration)

            Rectangle()
              .fill(
                .linearGradient(
                  colors: [
                    .clear,
                    .clear,
                    .bones.white.opacity(0.1),
                    .bones.white.opacity(0.5),
                    .bones.white.opacity(1),
                    .bones.white.opacity(0.5),
                    .bones.white.opacity(0.1),
                    .clear,
                    .clear,
                  ],
                  startPoint: .leading,
                  endPoint: .trailing
                )
              )
              .scaleEffect(y: 8)
              .keyframeAnimator(
                initialValue: 0,
                trigger: toggle,
                content: { content, progress in
                  content
                    .offset(x: -size.width + (progress * (size.width * 2 )))
                },
                keyframes: { _ in
                  CubicKeyframe(.zero, duration: 0.1)
                  CubicKeyframe(1, duration: moddedDuration)
                }
              )
              .rotationEffect(.init(degrees: 45))
          }
        }
        .clipShape(clipShape)
    } else {
      self
        .clipShape(clipShape)
    }

  }
}
