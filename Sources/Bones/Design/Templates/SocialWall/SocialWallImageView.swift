//
//  SocialWallImageView.swift
//
//
//  Created by Quentin PIDOUX on 20/10/2023.
//

import SwiftUI

/// A view representing an image in a social wall with optional tags.
///
/// ```
/// # Example usage:
/// ```
/// SocialWallImageView(
///   "https://example.com/image.jpg"
/// )
/// ```
public struct SocialWallImageView: View {
  let imageUrl  : String?
  let postTagName: String?
  let points: String?

  @State private var isImagePresented = false
  @State var isFullScreenViewVisible = false

  var didDoubleTap: (() -> Void)

  /// Creates a new social wall image view.
  /// - Parameters:
  ///   - imageUrl: The URL of the image to display.
  ///   - tagName: An optional tag name to display on the image.
  ///   - tagPoints: An optional points tag to display on the image.
  public init(_ imageUrl : String?,
              postTagName: String?,
              points: String?,
              didDoubleTap: @escaping (() -> Void)) {
    self.imageUrl  = imageUrl
    self.postTagName = postTagName
    self.points = points
    self.didDoubleTap = didDoubleTap
  }

  public var body: some View {
    VStack(
      alignment: .leading,
      spacing: .bones(.small),
      content: {
        HStack(
          alignment: .center,
          spacing: .bones(.medium),
          content: {
            if let postTagName {
              Text(postTagName)
                .font(.custom(.bones(.bodyBold)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.bones.textDark)
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
            }
          }
        )
        if let imageUrl {
          CachedAsyncImage(
            url: URL(string: imageUrl),
            transaction: .init(animation: .easeInOut(duration: 0.6))
          ) {
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
            .clipped()
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fill)
            .clipShape(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
            .background(
              CachedAsyncImage(url: URL(string: imageUrl)) { image in image.resizable()
                .cornerRadius(.bones(.medium))
                .blur(radius: 3.0)

              } placeholder: {}
            )
            .opacity(isImagePresented ? 0 : 1)
          }
          .clipped()
          .onTapGesture(count: 2, perform: {
            Haptic.feedback(.light)
            didDoubleTap()
          })
          .onTapGesture(count: 1, perform: {
            Haptic.feedback(.light)
            withAnimation(.spring()) {
              isImagePresented = true
            }
          })
          .onLongPressGesture(
            minimumDuration: 0.3,
            perform: {
              Haptic.feedback(.light)
              withAnimation(.spring()) {
                isImagePresented = true
              }
            }
          )
          .frame(maxWidth: .infinity)
          .aspectRatio(1, contentMode: .fill)
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
      })
      .clipped()
  }
}

/// A preview of the `SocialWallImageView`.
struct Preview_SocialWallImageView: View {
  public var body: some View {
    List {
      SocialWallImageView(
        "https://fastly.picsum.photos/id/193/400/620.jpg?hmac=Lj4n33P4clMl3L-UjR9BT6vMj2xwxrV2SFkStm6X-4Q",
        postTagName: "super !",
        points: "123 pts",
        didDoubleTap: {}
      )

      SocialWallImageView(
        "https://picsum.photos/600/200",
        postTagName: "Fait sauter des crêpes entre collègues super sympas !!!!!!!!!!!!",
        points: "123 pts",
        didDoubleTap: {}
      )

      SocialWallImageView(
        "https://picsum.photos/550",
        postTagName: nil,
        points: "123 pts",
        didDoubleTap: {}
      )

      SocialWallImageView(
        "https://picsum.photos/700",
        postTagName: nil,
        points: nil,
        didDoubleTap: {}
      )
    }
    .listBackgroundColor()
    .listStyle(.grouped)
  }
}

#Preview {
  Preview_SocialWallImageView()
}


public struct SwiftUIImageViewer: View {
  @Environment(\.dismiss) private var dismiss

  let imageUrl: String

  @State private var scale: CGFloat = 1
  @State private var lastScale: CGFloat = 1

  @State private var offset: CGPoint = .zero
  @State private var lastTranslation: CGSize = .zero

  @State var lastDragPosition: DragGesture.Value?

  @State var backgroundOpacity: Double = 1
  @State var cornerRadius: CGFloat = 0

  @State var isDragging = false

  public init(imageUrl: String?) {
    self.imageUrl = imageUrl ?? ""
  }

  public var body: some View {
    GeometryReader { proxy in
      ZStack {
        Color.bones.black
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .opacity(backgroundOpacity)

        CachedAsyncImage(url: URL(string: imageUrl)) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(scale)
            .cornerRadius(cornerRadius)
            .offset(x: offset.x, y: offset.y)
            .gesture(makeDragGesture(size: proxy.size))
            .gesture(makeMagnificationGesture(size: proxy.size))
        } placeholder: {
          ZStack(alignment: .center) {
            ProgressView()
          }
          .foregroundStyle(Color.bones.grey4)
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .edgesIgnoringSafeArea(.all)
      .transition(.movingParts.blur)
      .overlay(alignment: .topTrailing) {
        if isDragging == false {
          Button("") {  dismiss() }
            .buttonStyle(.bones(.navBar(.icon(.close))))
            .padding(.bones(.large))
        }
      }
      .animation(.default, value: isDragging)
      .animation(.default, value: cornerRadius)
    }
  }

  private func makeMagnificationGesture(size: CGSize) -> some Gesture {
    MagnificationGesture()
      .onChanged { value in
        let delta = value / lastScale
        lastScale = value

        // To minimize jittering
        if abs(1 - delta) > 0.01 {
          scale *= delta
        }
      }
      .onEnded { _ in
        lastScale = 1
        if scale < 1 {
          withAnimation {
            scale = 1
          }
        }
        adjustMaxOffset(size: size)
      }
  }

  private func makeDragGesture(size: CGSize) -> some Gesture {
    DragGesture()
      .onChanged { value in
        let diff = CGPoint(
          x: value.translation.width - lastTranslation.width,
          y: value.translation.height - lastTranslation.height
        )
        offset = .init(x: offset.x + diff.x, y: offset.y + diff.y)
        lastTranslation = value.translation
        lastDragPosition = value
        isDragging = true
        cornerRadius = 16

        backgroundOpacity = Double(1 - (abs(offset.y*3) / 1000))
      }
      .onEnded { value in
        let timeDiff = value.time.timeIntervalSince(self.lastDragPosition!.time)
        let speed:CGFloat = CGFloat(value.translation.height - self.lastDragPosition!.translation.height) / CGFloat(timeDiff)

        if(speed > 300) {
          dismiss()
        }
        adjustMaxOffset(size: size)
      }
  }

  private func adjustMaxOffset(size: CGSize) {
    let maxOffsetX = (size.width * (scale - 1)) / 2
    let maxOffsetY = (size.height * (scale - 1)) / 2

    var newOffsetX = offset.x
    var newOffsetY = offset.y

    if abs(newOffsetX) > maxOffsetX {
      newOffsetX = maxOffsetX * (abs(newOffsetX) / newOffsetX)
    }
    if abs(newOffsetY) > maxOffsetY {
      newOffsetY = maxOffsetY * (abs(newOffsetY) / newOffsetY)
    }

    let newOffset = CGPoint(x: newOffsetX, y: newOffsetY)
    if newOffset != offset {
      withAnimation {
        offset = newOffset
        backgroundOpacity = 1
        cornerRadius = 0
        isDragging = false
      }
    }
    self.lastTranslation = .zero
  }
}


struct BackgroundBlurView: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    DispatchQueue.main.async {
      view.superview?.superview?.backgroundColor = .clear
    }
    return view
  }

  func updateUIView(_ uiView: UIView, context: Context) {}
}
