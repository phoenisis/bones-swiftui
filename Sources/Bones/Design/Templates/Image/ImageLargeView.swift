//
//  ImageLargeView.swift
//
//
//  Created by Quentin PIDOUX on 24/01/2024.
//

import SwiftUI

public struct ImageLargeView: View {
  let imageUrl  : String?
  let points: String?

  @State private var isImagePresented = false
  @State var isFullScreenViewVisible = false

  /// Creates a new social wall image view.
  /// - Parameters:
  ///   - imageUrl: The URL of the image to display.
  ///   - tagName: An optional tag name to display on the image.
  ///   - tagPoints: An optional points tag to display on the image.
  public init(_ imageUrl : String?,
              points: String?) {
    self.imageUrl  = imageUrl
    self.points = points
  }

  public var body: some View {

    if let imageUrl {
      CachedAsyncImage(
        url: URL(string: imageUrl),
        transaction: .init(animation: .easeInOut(duration: 0.6))) {
          phase in
          ZStack {
            Rectangle()
              .fill(Color(.clear))
              .aspectRatio(1/1, contentMode: .fit)
            switch phase {
              case .success(let image):
                image
                  .resizable()
                  .scaledToFill()
                  .zIndex(1)
                  .layoutPriority(-1)
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
          .clipShape(RoundedRectangle(bonesRadius: .bones(.none), style: .continuous))
          .opacity(isImagePresented ? 0 : 1)
        }
        .clipped()
        .overlay(alignment: .bottomTrailing, content: {
          if let points {
            Text(points)
              .font(.custom(.bones(.bodyBold)))
              .padding(.bones(.large))
              .background(
                BonesPointsShape()
                  .fill(Color.bones.primary)
              )
              .foregroundStyle(Color.bones.primaryForeground)
              .padding(.trailing, 8)
              .padding(.bottom, 9)
          }
        })
        .onTapGesture(
          count: 1,
          perform: {
            Haptic.feedback(.light)
            withAnimation(.spring()) {
              isImagePresented = true
            }
          }
        )
        .onLongPressGesture(
          minimumDuration: 0.3,
          perform: {
            Haptic.feedback(.light)
            withAnimation(.spring()) {
              isImagePresented = true
            }
          }
        )
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
        .listRowInsets(EdgeInsets())
    } else {
      VStack(
        alignment: .trailing,
        spacing: nil,
        content: {
          if let points {
            Text(points)
              .font(.custom(.bones(.bodyBold)))
              .padding(.bones(.large))
              .background(
                BonesPointsShape()
                  .fill(Color.bones.primary)
              )
              .foregroundStyle(Color.bones.primaryForeground)
              .padding(.trailing, 8)
              .padding(.bottom, 9)
              .frame(maxWidth: .infinity, alignment: .trailing)

          }
        }
      )
      .listRowInsets(EdgeInsets())
    }
  }
}

/// A preview of the `SocialWallImageView`.
struct Preview_ImageLargeView: View {
  public var body: some View {
    List {
      ImageLargeView(
        nil,
        points: "123 pts"
      )

      ImageLargeView(
        "https://picsum.photos/1000/400",
        points: "123 pts"
      )

      ImageLargeView(
        "https://picsum.photos/600",
        points: "123 pts"
      )

      ImageLargeView(
        "https://picsum.photos/550",
        points: "123 pts"
      )

      ImageLargeView(
        "https://picsum.photos/700",
        points: nil
      )
    }
    .listBackgroundColor()
    .listStyle(.grouped)
  }
}

#Preview {
  Preview_ImageLargeView()
}
