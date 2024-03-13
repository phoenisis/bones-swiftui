//
//  QuizImageView.swift
//
//
//  Created by Quentin PIDOUX on 20/10/2023.
//

import SwiftUI

/// A view representing an image in a quiz detail with optional tags.
///
/// ```
/// # Example usage:
/// ```
/// SocialWallImageView(
///   "https://example.com/image.jpg"
/// )
/// ```
public struct QuizImageView: View {
  let imageUrl  : String?
  let points: String?
  let remainingDate: Date?

  @State private var isImagePresented = false
  @State var isFullScreenViewVisible = false

  /// Creates a new social wall image view.
  /// - Parameters:
  ///   - imageUrl: The URL of the image to display.
  ///   - tagName: An optional tag name to display on the image.
  ///   - tagPoints: An optional points tag to display on the image.
  public init(_ imageUrl : String?,
              points: String?,
              remainingDate: Date?) {
    self.imageUrl  = imageUrl
    self.points = points
    self.remainingDate = remainingDate
  }

  public var body: some View {
    VStack(
      alignment: .leading,
      spacing: .bones(.small),
      content: {
        if let imageUrl {
          CachedAsyncImage(
            url: URL(string: imageUrl),
            transaction: .init(
              animation: .easeInOut(duration: 0.6)
            )
          ) {
            phase in
            ZStack {
              Color.bones.white
              switch phase {
                case .success(let image):
                  image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1.6, contentMode: .fit)
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
            .frame(maxWidth: .infinity)
            .aspectRatio(1.6, contentMode: .fill)
            .clipShape(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
            .background(
              CachedAsyncImage(url: URL(string: imageUrl)) { image in image.resizable()
                .cornerRadius(.bones(.medium))
                .blur(radius: 3.0)

              } placeholder: {}
            )
            .opacity(isImagePresented ? 0 : 1)
          }
          .onTapGesture(
            count: 1,
            perform: {
              Haptic.feedback(.light)
              withAnimation(.spring()) {
                isImagePresented = true
              }
            }
          )
          .frame(maxWidth: .infinity)
          .aspectRatio(1.6, contentMode: .fill)
          .fullScreenCover(isPresented: $isImagePresented) {
            Group {
              if isFullScreenViewVisible {
                SwiftUIImageViewer(imageUrl: imageUrl)

                  .onDisappear {
                    isImagePresented = false
                  }
                  .background(BackgroundBlurView())
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
              }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
              isFullScreenViewVisible = true
            }
            .background(BackgroundBlurView())
          }
          .transaction({ transaction in
            transaction.disablesAnimations = false
            transaction.animation = .easeIn(duration: 0.3)
          })
          .dynamicTypeSize(.xSmall ... .accessibility1)
          .frame(maxWidth: .infinity)
        }
        HStack(
          alignment: .center,
          spacing: .bones(.medium),
          content: {
            if let remainingDate {
              Text(remainingDate, style: .relative)
                .font(.custom(.bones(.smallBold)))
            }
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
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
          }
        )
      }
    )
  }
}

/// A preview of the `SocialWallImageView`.
struct Preview_QuizImageView: View {
  public var body: some View {
    List {
      QuizImageView(
        "https://picsum.photos/1000/400",
        points: "123 pts",
        remainingDate: Date(timeIntervalSinceNow: 6 * 60 * 60 * 24)
      )

      QuizImageView(
        "https://picsum.photos/600",
        points: "123 pts",
        remainingDate: Date(timeIntervalSinceNow: 1 * 60 * 60 * 24)
      )

      QuizImageView(
        "https://picsum.photos/550",
        points: "123 pts",
        remainingDate: nil
      )

      QuizImageView(
        "https://picsum.photos/700",
        points: nil,
        remainingDate: nil
      )
    }
    .listBackgroundColor()
    .listStyle(.grouped)
  }
}

#Preview {
  Preview_QuizImageView()
}
