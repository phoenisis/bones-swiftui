//
//  SwiftUIView.swift
//
//
//  Created by Quentin PIDOUX on 28/12/2023.
//

import SwiftUI

public struct HistorySocialTagView: View {
  @State private var isImagePresented = false
  @State var isFullScreenViewVisible = false
  
  let imageUrl: String?
  let points: String?
  let description: String?
  let member: (image: String?, displayName: String)?
  let isActive: Bool
  let isHidden: Bool
  let didTap: () -> Void

  public init(imageUrl: String?, points: String?, description: String?, member: (image: String?, displayName: String)?, isActive: Bool, isHidden: Bool, didTap: @escaping () -> Void) {
    self.imageUrl = imageUrl
    self.points = points
    self.description = description
    self.member = member
    self.isActive = isActive
    self.isHidden = isHidden
    self.didTap = didTap
  }

  public var body: some View {
    Button("") {
      Haptic.feedback(.light)
      withAnimation(.spring()) {
        isImagePresented = true
      }
      didTap()
    }
      .buttonStyle(
        HistorySocialTagButtonStyle(
          imageUrl: imageUrl,
          points: points, 
          description: description,
          member: member,
          isHidden: isHidden, 
          isFullScreenViewVisible: isFullScreenViewVisible
        )
      )
      .disabled(isActive == false)
      .fullScreenCover(isPresented: $isImagePresented) {
        Group {
          if isFullScreenViewVisible {
            SwiftUIImageViewer(imageUrl: imageUrl)
              .onDisappear {
                isImagePresented = false
                isFullScreenViewVisible = false
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
      .listRowSeparator(.hidden)
      .listRowBackground(Color.clear)
  }
}

struct HistorySocialTagButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  let imageUrl: String?
  let points: String?
  let description: String?
  let member: (image: String?, displayName: String)?
  let isHidden: Bool
  let isFullScreenViewVisible: Bool

  func makeBody(configuration: Configuration) -> some View {
    VStack(
      alignment: .leading,
      content: {
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
                    .opacity(isFullScreenViewVisible ? 0 : 1)
                case .failure(let error):
                  Text(error.localizedDescription)
                    .font(.caption)
                case .empty:
                  ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(Color.bones.grey4)
                    .transition(.movingParts.snapshot)

                @unknown default:
                  EmptyView()
              }
            }
            .clipShape(RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous))
          }
          .clipped()
        }
        HStack(
          spacing: .bones(.large),
          content: {
            TagView("socialtag", icon: .camera, style: .default)
            Spacer()
            if let points {
              Text(points)
                .font(.custom(.bones(.bodyBold)))
                .padding()
                .background(
                  BonesEarnPointShape()
                    .fill(Color.bones.primary)
                )
            }
          }
        )
        if let description {
          Text(description)
            .font(.custom(.bones(.bodyBold)))
            .padding(.bottom, .bones(.large))
        }
        HStack(alignment: .center, spacing: .bones(.large), content: {
          if let member {
            if let memberImage = member.0 {
              AvatarGroupView(size: .medium, type: .user, images: [memberImage])
            }
            Text(member.1)
              .font(.custom(.bones(.smallBold)))
          }
        })
      }
    )
    .padding(.bones(.large))
    
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(bonesRadius: .bones(.large), style: .continuous)
        .fill(Color.bones.white)
        .shadow(
          radius: .bones(
            isEnabled
            ? configuration.isPressed ? .close : .far
            : .none
          )
        )
    )
    .opacity(isHidden ? 0.5 : 1)
    .animation(.default, value: configuration.isPressed)
    .conditionalEffect(
      .pushDown,
      condition: configuration.isPressed
    )
  }
}

#Preview {
  List {
    Section {
      HistorySocialTagView(
        imageUrl: "https://picsum.photos/800/250",
        points: "12 pts", 
        description: "test",
        member: (image: "https://picsum.photos/70", displayName: "john DOE"),
        isActive: true,
        isHidden: false,
        didTap: {}
      )

      HistorySocialTagView(
        imageUrl: "https://picsum.photos/800/2400",
        points: "12 pts", 
        description: nil,
        member: (image: "https://picsum.photos/70", displayName: "john DOE"),
        isActive: true,
        isHidden: false,
        didTap: {}
      )

      HistorySocialTagView(
        imageUrl: nil,
        points: "12 pts", 
        description: nil,
        member: (image: "https://picsum.photos/70", displayName: "john DOE"),
        isActive: false,
        isHidden: true,
        didTap: {}
      )


    } header: {
      Text(Date(), style: .date)
        .font(.custom(.bones(.bodyBold)))
        .foregroundStyle(Color.bones.foreground)
        .frame(maxWidth: .infinity)
    }
  }
  .listStyle(.plain)
  .listRowSpacing(16)
  .listBackgroundColor(.bones(.AQILevel1))
}
