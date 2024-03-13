//
//  ParticlesEffect.swift
//  
//
//  Created by Quentin PIDOUX on 17/10/2023.
//

import Pow
import SwiftUI

extension View {
  @available(*, deprecated, message: "Use spray effect from Pow library, see more at https://movingparts.io/pow#jump")
  /// Adds a particle effect modifier to the view.
  /// - Parameters:
  ///   - systemImage: A system image name that represents the particle.
  ///   - status: A boolean that triggers the particle effect.
  ///   - activeTint: The color of the particle when active.
  ///   - inactiveTint: The color of the particle when inactive.
  /// - Returns: A view that applies a particle effect based on the parameters.
  @ViewBuilder
  public func particleEffect(
    systemImage: String,
    status: Bool,
    activeTint: Color = .bones.alert,
    inactiveTint: Color = .clear
  ) -> some View {
    self.modifier(
      ParticleModifier(systemImage: systemImage, status: status, activeTint: activeTint, inactiveTint: inactiveTint)
    )
  }
}

/// A struct representing a particle used in a particle effect.
struct Particle: Identifiable {
  public var id: UUID = .init()
  public var randomX: CGFloat = 0
  public var randomY: CGFloat = 0
  public var scale: CGFloat = 1
  public var opacity: CGFloat = 1

  /// Resets all properties of the particle to their initial state.
  mutating func reset() {
    randomX = 0
    randomY = 0
    scale   = 1
    opacity = 1
  }
}

/// A private `ViewModifier` that applies a particle effect to a view.
fileprivate struct ParticleModifier: ViewModifier {
  var systemImage: String
  var status: Bool
  var activeTint: Color
  var inactiveTint: Color
  @State var hasChanged: Bool = false

  @State private var particles: [Particle] = []

  /// Body of the `ParticleModifier`, applies an overlay of particles to the content.
  func body(content: Content) -> some View {
    content
      .overlay(alignment: .top) {
        ZStack {
          ForEach(particles) { particle in
            Image(systemName: systemImage)
              .foregroundColor(status ? activeTint : inactiveTint)
              .scaleEffect(particle.scale)
              .offset(x: particle.randomX, y: particle.randomY)
              .opacity(particle.opacity)
              .opacity(status ? 1 : 0)
              .animation(.none, value: status)
          }
        }.opacity(hasChanged ? 1 : 0)
          .onAppear {
            /// Adding Base Particle For animation
            if particles.isEmpty {
              for _ in 1...15 {
                let particle = Particle()
                particles.append(particle)
              }
            }
          }
          .onChange(of: status) { _, newValue in
            hasChanged = true
            if !newValue {
              for index in particles.indices {
                particles[index].reset()
              }
            } else {
              for index in particles.indices {
                let total: CGFloat = CGFloat(particles.count)
                let progress: CGFloat = CGFloat(index) / total

                let maxX: CGFloat = (progress > 0.5) ? 100 : -100
                let maxY: CGFloat = 60

                let randomX: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxX)
                let randomY: CGFloat = ((progress > 0.5 ? progress - 0.5 : progress) * maxY) + 35
                let randomScale: CGFloat = .random(in: 0.35...1)

                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {

                  let extraRandomX: CGFloat = (progress < 0.5 ? .random(in: 0...10) : .random(in: -10...0))
                  let extraRandomY: CGFloat = .random(in: 0...30)

                  particles[index].randomX = randomX + extraRandomX
                  particles[index].randomY = -randomY - extraRandomY
                }

                withAnimation(.easeInOut(duration: 0.3)) {
                  particles[index].scale = randomScale
                }

                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)
                  .delay(0.25 + (Double(index) * 0.005))) {
                    particles[index].scale = 0.001
                  }
              }
            }
          }
      }
  }
}

/// A preview struct to visualize the particle effect in SwiftUI previews.
struct Preview_ParticlesEffect: View {
  @State var isToggle: Bool = false

  var body: some View {
    HStack {
      Button(action: {
        isToggle.toggle()

        Task {
          try await Task.sleep(for: .seconds(2))
          isToggle.toggle()
        }
      }, label: {
        Image(.bones(isToggle ? .likeFill : .like))
          .changeEffect(
            .spray(origin: UnitPoint(x: 0.25, y: 0.5)) {
              Image(systemName: "heart.fill")
                .foregroundStyle(Color.bones.alert)
            }, value: isToggle)
      })
    }
  }
}

#Preview {
  Preview_ParticlesEffect()
}
