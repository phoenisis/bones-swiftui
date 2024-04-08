//
//  RankedElementView.swift
//
//
//  Created by Quentin PIDOUX on 27/11/2023.
//

import SwiftUI

public struct RankedElementView: View {
  public struct Medal {
    let image: String
    let name: String
    let count: Int

    public init(image: String, name: String, count: Int) {
      self.image = image
      self.name = name
      self.count = count
    }
  }

  let title: String
  let rank: Int?
  let imageUrl: String?
  let showImage: Bool

  let points: String?
  let medals: [Medal]

  let isHighlighted: Bool

  public init(title: String, rank: Int?, imageUrl: String?, showImage: Bool = true, points: String?, medals: [Medal], isHighlighted: Bool = false) {
    self.title = title
    self.rank = rank
    self.imageUrl = imageUrl
    self.showImage = showImage
    self.points = points
    self.medals = Array(medals.sorted { $0.count > $1.count }.prefix(8))
    self.isHighlighted = isHighlighted
  }

  public var body: some View {
    HStack(alignment: .center, spacing: .bones(.large)) {
      if showImage {
        if let imageUrl {
          CachedAsyncImage(url: URL(string: imageUrl),
                           transaction: .init(animation: .easeInOut(duration: 0.6))) {
            phase in
            ZStack {
              Color.clear
                .frame(width: 60, height: 80)
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
            .frame(width: 60, height: 80)
            .clipShape(BonesShieldShape())
            .background(
              BonesShieldShape()
                .stroke(Color.bones.black.opacity(0.4), lineWidth: 1)
            )
          }
        } else {
          BonesIcon(icon: .bones(.team), renderingMode: .template)
            .font(.custom(.bones(.h1)))
            .frame(width: 60, height: 80)
            .background(Color.bones.grey2)
            .clipShape(BonesShieldShape())
            .background(
              BonesShieldShape()
                .stroke(Color.bones.black.opacity(0.4), lineWidth: 1)
            )
        }
      }
      VStack(
        alignment: .leading,
        spacing: .bones(.small)
      ) {
        HStack(
          alignment: .center,
          spacing: .bones(.small),
          content: {
            Text(title)
              .font(.custom(.bones(.bodyBold)))
              .lineLimit(2)
              .multilineTextAlignment(.leading)
              .frame(maxWidth: .infinity, alignment: .leading)
            Text(rank?.ordinalString() ?? "")
              .font(.custom(.bones(.h2)))
              .lineLimit(1)
              .frame(alignment: .trailing)
          }
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        if medals.isEmpty {
          if let points {
            Text(points)
              .font(.custom(.bones(.bodyBold)))
              .lineLimit(1)
              .frame(maxWidth: .infinity, alignment: .trailing)
          } else {
            EmptyView()
          }
        }
        else if (medals.count == 1) {
          singleMedal(medals[0])
        } else {
          multipleMedal(medals)
        }
      }
    }
    .padding(.bones(.large))
    .frame(height: isHighlighted ? 94 : 88)
    .listRowBackground(
      RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        .fill(
          Color.bones.white
            .shadow(.bones.drop(isHighlighted ? .far : .none))
        )
        .overlay(
          RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
            .stroke(Color.bones.primary, lineWidth: isHighlighted ? 2 : 0)
        )
        .padding(.horizontal, .bones(isHighlighted ? .medium : .large))
    )
    .foregroundStyle(Color.bones.textDark)
    .listRowSeparator(.hidden)
    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
  }

  fileprivate func singleMedal(_ medal: Medal) -> some View {
    HStack(
      alignment: .center,
      spacing: .bones(.small),
      content: {
        HStack(
          alignment: .center,
          spacing: .bones(.small),
          content: {
            CachedAsyncImage(url: URL(string: medal.image)) { image in image.resizable()
              .scaledToFit()
            } placeholder: {
              ZStack(alignment: .center) {
                ProgressView()
              }
              .foregroundStyle(Color.bones.grey4)
            }
            .frame(width: 40, height: 40)
            Text(medal.name)
              .font(.custom(.bones(.bodyBold)))
              .lineLimit(1)
              .frame(maxWidth: .infinity, alignment: .leading)
          }
        )
        if let points {
          Text(points)
            .font(.custom(.bones(.bodyBold)))
            .lineLimit(1)
            .frame(alignment: .trailing)
        }
      }
    )
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  fileprivate func multipleMedal(_ medals: [Medal]) -> some View {
    LazyVGrid(
      columns: [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
      ]
    ) {
      ForEach(medals, id: \.image) { medal in
        HStack(alignment: .center, content: {
          CachedAsyncImage(url: URL(string: medal.image)) { image in image.resizable()
            .scaledToFit()
          } placeholder: {
            ZStack(alignment: .center) {
              ProgressView()
            }
            .foregroundStyle(Color.bones.grey4)
          }
          .frame(width: 22, height: 22)

          HStack(content: {
            Text("x") +
              Text(medal.count, format: .number)
          })
          .font(.custom(.bones(.small)))
        })
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)

  }
}


#Preview {
  List {
    RankedElementView(
      title: "NOM DE L’ÉQUIPE",
      rank: 1,
      imageUrl: "https://picsum.photos/220/670",
      points: "1000k pts",
      medals: [
        .init(image: "https://picsum.photos/200", name: "Boogie Star", count: 1)
      ]
    ) 
    RankedElementView(
      title: "NOM DE L’ÉQUIPE",
      rank: 1,
      imageUrl: "https://picsum.photos/400",
      points: "1000k pts",
      medals: [
        .init(image: "https://picsum.photos/200", name: "Boogie Star", count: 1)
      ],
      isHighlighted: true
    )

    RankedElementView(
      title: "est qui minim occaecat sit veniam cillum laboris anim ea cupidatat eu",
      rank: 1,
      imageUrl: "https://picsum.photos/400",
      points: "1000k pts",
      medals: [
        .init(image: "https://picsum.photos/200", name: "nostrud ipsum cillum proident", count: 1)
      ]
    )

    RankedElementView(
      title: "NOM DE L’ÉQUIPE",
      rank: 5,
      imageUrl: "https://picsum.photos/600",
      points: nil,
      medals: [
        .init(image: "https://picsum.photos/200", name: "Boogie Star", count: 2),
        .init(image: "https://picsum.photos/220", name: "Boogie Star", count: 1),
        .init(image: "https://picsum.photos/240", name: "Boogie Star", count: 4)
      ]
    )

    RankedElementView(
      title: "est qui minim occaecat sit veniam cillum laboris anim ea cupidatat eu",
      rank: 5,
      imageUrl: "https://picsum.photos/600",
      points: nil,
      medals: [
        .init(image: "https://picsum.photos/200", name: "Boogie Star", count: 2),
        .init(image: "https://picsum.photos/220", name: "Boogie Star", count: 1),
        .init(image: "https://picsum.photos/240", name: "Boogie Star", count: 4)
      ]
    )

    RankedElementView(
      title: "NOM DE L’ÉQUIPE",
      rank: 5,
      imageUrl: "https://picsum.photos/600",
      points: nil,
      medals: [
        .init(image: "https://picsum.photos/200", name: "Boogie Star", count: 2),
        .init(image: "https://picsum.photos/220", name: "Boogie Star", count: 1),
        .init(image: "https://picsum.photos/240", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/230", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/260", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/280", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/290", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/300", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/320", name: "Boogie Star", count: 4),
      ]
    )   
    RankedElementView(
      title: "est qui minim occaecat sit veniam cillum laboris anim ea cupidatat eu",
      rank: 5,
      imageUrl: "https://picsum.photos/600",
      points: nil,
      medals: [
        .init(image: "https://picsum.photos/200", name: "Boogie Star", count: 2),
        .init(image: "https://picsum.photos/220", name: "Boogie Star", count: 1),
        .init(image: "https://picsum.photos/240", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/230", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/260", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/280", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/290", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/300", name: "Boogie Star", count: 4),
        .init(image: "https://picsum.photos/320", name: "Boogie Star", count: 4),
      ]
    )

    RankedElementView(title: "NOM DE L’ÉQUIPE", rank: 1, imageUrl: nil, points: "1000k pts", medals: [])
    RankedElementView(title: "NOM l'entitée", rank: 1, imageUrl: nil, showImage: false, points: "1000k pts", medals: [])
    RankedElementView(title: "NOM l'entitée", rank: 1, imageUrl: nil, showImage: false, points: "1000k pts", medals: [], isHighlighted: true)
    RankedElementView(title: "NOM l'entitée", rank: 1, imageUrl: nil, showImage: false, points: nil, medals: [])
    RankedElementView(title: "incididunt et id sit anim veniam ipsum esse veniam Lorem anim duis id consequat nisi incididunt ea tempor labore et cupidatat cupidatat culpa non eiusmod", rank: 1, imageUrl: nil, showImage: false, points: nil, medals: [])
    RankedElementView(title: "NOM l'entitée", rank: nil, imageUrl: nil, showImage: false, points: nil, medals: [])
  }
  .listStyle(.grouped)
  .listBackgroundColor()
  .listRowSpacing(8)
}
