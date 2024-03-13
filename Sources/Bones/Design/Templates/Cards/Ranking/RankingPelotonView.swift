//
//  RankingPelotonView.swift
//
//
//  Created by Quentin PIDOUX on 24/11/2023.
//

import SwiftUI

public struct CardHostView<Content: View>: View {
  var title: String
  var buttonTitle: String?
  var isSharable: Bool
  var content: () -> Content

  var didTapButton: (() -> Void)?

  public var body: some View {
    VStack(alignment: .leading,content: {
      HStack(alignment: .top, spacing: .bones(.medium), content: {
        Text(title)
          .font(.custom(.bones(.h3)))
          .frame(maxWidth: .infinity, alignment: .leading)

        if isSharable {
          Button(action: {}, label: {
            BonesIcon(icon: .bones(.share))
              .frame(width: 24, height: 24)
          })
        }
      })
      content()

      if let buttonTitle {
        HStack(content: {
          Button(buttonTitle) { didTapButton?() }
            .buttonStyle(.bones(.medium(.outline(icon: .arrowRight))))
        })
        .frame(maxWidth: .infinity, alignment: .trailing)
      }
    })

    .foregroundStyle(Color.bones.textDark)
    .padding(.bones(.large))
    .listRowBackground(
      RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        .fill(Color.bones.white)
        .frame(maxWidth: .infinity)
        .padding(.bones(.medium))
    )
    .listRowSeparator(.hidden)
  }
}

public struct RankingPelotonView: View {
  public struct PelotonItem: Equatable {
    var title: String
    var imageUrl: String?
    var rank: Int
    var pointDiff: String?
    var isHighlighted: Bool

    public init(title: String, imageUrl: String?, rank: Int, pointDiff: String?, isHighlighted: Bool) {
      self.title = title
      self.imageUrl = imageUrl
      self.rank = rank
      self.pointDiff = pointDiff
      self.isHighlighted = isHighlighted
    }
  }

  let columnsPeloton = [
    GridItem(.flexible(minimum: 50), spacing: 36),
    GridItem(.flexible(minimum: 50), spacing: 36),
    GridItem(.flexible(minimum: 50), spacing: 36),
  ]

  let columnsRibbon = [
    GridItem(.flexible(minimum: 20)),
    GridItem(.flexible(minimum: 20)),
    GridItem(.flexible(minimum: 20)),
    GridItem(.flexible(minimum: 20)),
    GridItem(.flexible(minimum: 20)),
  ]

  let columnsMedals = [
    GridItem(.flexible(minimum: 20)),
    GridItem(.flexible(minimum: 20)),
    GridItem(.flexible(minimum: 20)),
  ]

  let title: String
  let description: String
  let imageUrl: String?

  let leadingItem: PelotonItem
  let middleItem: PelotonItem
  let trailingItem: PelotonItem

  var showShield: Bool
  var medals: [(String, Int)]

  public init(title: String, description: String, imageUrl: String?, leadingItem: PelotonItem, middleItem: PelotonItem, trailingItem: PelotonItem, showShield: Bool = true, medals: [(String, Int)] = []) {
    self.title = title
    self.description = description
    self.imageUrl = imageUrl
    self.leadingItem = leadingItem
    self.middleItem = middleItem
    self.trailingItem = trailingItem
    self.showShield = showShield
    self.medals = medals.sorted(by: { $0.1 > $1.1 })
  }

  fileprivate func heading() -> some View {
    return HStack(alignment: .top, spacing: .bones(.medium), content: {
      Text(description)
        .font(.custom(.bones(.bodyBold)))
        .frame(maxWidth: .infinity, alignment: .leading)
      if let imageUrl {
        CachedAsyncImage(url: URL(string: imageUrl)) { image in image.resizable()
          .scaledToFit()
          .frame(width: 86, height: 86)
        } placeholder: {
          ZStack(alignment: .center) {
            ProgressView()
          }
          .foregroundStyle(Color.bones.grey4)
        }
      }
    })
    .frame(maxWidth: .infinity, alignment: .leading)

  }

  fileprivate func shieldImage(url: String?, isHighlighted: Bool) -> some View {
    if let url {
      return AnyView(
        CachedAsyncImage(url: URL(string: url)) { image in image.resizable()
          .scaledToFill()
        } placeholder: {
          /// Placeholder with a team icon and a progress view until the image loads.
          ZStack(alignment: .center) {
            BonesIcon(icon: .bones(.team), renderingMode: .template)
            ProgressView()
          }
          .foregroundStyle(Color.bones.grey3)
        }
        .frame(width: isHighlighted ? 80 : 60, height: isHighlighted ? 100 : 80)
        .clipShape(BonesShieldShape())
        .background(
          BonesShieldShape()
            .stroke(Color.bones.black.opacity(0.4), lineWidth: 1)
        )
      )
    } else {
      return AnyView(
        BonesIcon(icon: .bones(.team), renderingMode: .template)
          .frame(width: isHighlighted ? 80 : 60, height: isHighlighted ? 100 : 80)
          .background(Color.bones.grey3)
          .clipShape(BonesShieldShape())
          .background(
            BonesShieldShape()
              .stroke(Color.bones.black.opacity(0.4), lineWidth: 1)
          )
      )
    }

  }

  fileprivate func pelotonItem(title: String, imageUrl: String?, isHighlighted: Bool, showShield: Bool) -> some View {
    return VStack(
      alignment: .center,
      spacing: .bones(.small)
    ) {
      if showShield {
        Text(title)
          .font(.custom(.bones(.smallBold)))
          .multilineTextAlignment(.center)
          //          .padding(.bones(.small))
          .frame(maxWidth: .infinity)
          .frame(height: 40)
          .foregroundStyle(Color.bones.textDark)
        //          .background(
        //            RoundedRectangle(bonesRadius: .bones(.small))
        //              .fill(Color.bones.primary)
        //          )

        shieldImage(url: imageUrl, isHighlighted: isHighlighted)
      } else {
        Text(title)
          .font(.custom(.bones(.smallBold)))
          .multilineTextAlignment(.center)
          .lineLimit(3)
          .padding(.bones(.small))
          .frame(maxWidth: .infinity)
          .frame(height: isHighlighted ? 80 : 60)
          .foregroundStyle(Color.bones.primaryForeground)
          .background(
            BonesBubbleDownShape()
              .fill(Color.bones.primary)
          )
          .padding(.bottom, 4)
      }
    }
    .frame(maxHeight: .infinity, alignment: .bottom)
  }

  fileprivate func peloton(showShield: Bool) -> some View {
    return VStack(
      alignment: .center,
      spacing: 0
    ) {
      LazyVGrid(
        columns: columnsPeloton,
        alignment: .center
      ) {
        pelotonItem(title: leadingItem.title, imageUrl: leadingItem.imageUrl, isHighlighted: leadingItem.isHighlighted, showShield: showShield)
        pelotonItem(title: middleItem.title, imageUrl: middleItem.imageUrl, isHighlighted: middleItem.isHighlighted, showShield: showShield)
        pelotonItem(title: trailingItem.title, imageUrl: trailingItem.imageUrl, isHighlighted: trailingItem.isHighlighted, showShield: showShield)
      }
      .padding(.bottom, -4)
      .zIndex(1)

      LazyVGrid(
        columns: columnsRibbon,
        alignment: .center
      ) {
        Text(leadingItem.rank.ordinalString())
          .lineLimit(1)
          .frame(maxWidth: .infinity)
        Text(leadingItem.pointDiff ?? "")
          .lineLimit(2)
          .frame(maxWidth: .infinity)
        Text(middleItem.rank.ordinalString())
          .lineLimit(1)
          .frame(maxWidth: .infinity)
        Text(middleItem.pointDiff ?? "")
          .lineLimit(2)
          .frame(maxWidth: .infinity)
        Text(trailingItem.rank.ordinalString())
          .lineLimit(1)
          .frame(maxWidth: .infinity)
      }
      .font(.custom(.bones(.smallBold)))
      .frame(height: 40)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)
      .foregroundStyle(Color.bones.textDark)
    }
    .frame(maxWidth: .infinity, alignment: .center)
    .minimumScaleFactor(0.9)
  }

  public var body: some View {
    CardHostView(
      title: title,
      buttonTitle: nil,
      isSharable: false,
      content: {
        VStack(
          alignment: .leading,
          spacing: .bones(.large),
          content: {
            heading()
            peloton(showShield: showShield)

            if medals.count > 1 && medals.first?.1 ?? 0 > 1 {
              VStack(alignment: .leading, spacing: .bones(.medium), content: {
                Text("ranking_peloton_medals_title")
                  .font(.custom(.bones(.bodyBold)))

                LazyVGrid(
                  columns: columnsMedals,
                  alignment: .center,
                  spacing: 16
                ) {
                  ForEach(medals, id: \.0) { medal in
                    HStack(
                      alignment: .center,
                      spacing: .bones(.medium),
                      content: {
                        CachedAsyncImage(url: URL(string: medal.0)) { image in image.resizable()
                          .scaledToFit()
                          .frame(width: 70, height: 70)
                        } placeholder: {
                          ZStack(alignment: .center) {
                            ProgressView()
                          }
                          .foregroundStyle(Color.bones.grey4)
                        }
                        .frame(width: 70, height: 70)

                        HStack(
                          alignment: .center,
                          spacing: 0,
                          content: {
                            Text("x")
                              .font(.custom(.bones(.bodyBold)))
                            Text(medal.1, format: .number)
                              .font(.custom(.bones(.bodyBold)))
                          }
                        )
                      }
                    )
                  }
                }
              })

            }
          })
          .padding(.bottom, .bones(.large))
      })
  }
}


#Preview {
  List {
    RankingPelotonView(
      title: "Ranking Peloton",
      description: "Elle a gagné une médaille Incroyable",
      imageUrl: "https://picsum.photos/200/300",
      leadingItem: .init(title: "Quentin",
                         imageUrl: "https://www.shutterstock.com/image-photo/white-plate-placed-on-background-260nw-1703653534.jpg",
                         rank: 3,
                         pointDiff: "500pts d’écart",
                         isHighlighted: true),
      middleItem: .init(title: "John",
                        imageUrl: "https://picsum.photos/300",
                        rank: 2,
                        pointDiff: "1000pts d’écart",
                        isHighlighted: false),
      trailingItem: .init(title: "Morice",
                          imageUrl: "https://picsum.photos/400",
                          rank: 1,
                          pointDiff: "",
                          isHighlighted: false),
      medals: [
        ("https://picsum.photos/50", 1)
      ]
    )



    RankingPelotonView(
      title: "Consequat dolore esse commodo et do pariatur incididunt commodo duis ad id anim ullamco laborum.",
      description: "Labore culpa nostrud ipsum irure exercitation nostrud. Esse fugiat dolor non voluptate nostrud velit amet.",
      imageUrl: "https://picsum.photos/200/300",
      leadingItem: .init(title: "Quentin",
                         imageUrl: "https://picsum.photos/200",
                         rank: 3,
                         pointDiff: "500pts d’écart",
                         isHighlighted: false),
      middleItem: .init(title: "John",
                        imageUrl: "https://picsum.photos/300",
                        rank: 2,
                        pointDiff: "1000pts d’écart",
                        isHighlighted: true),
      trailingItem: .init(title: "Morice",
                          imageUrl: "https://picsum.photos/400",
                          rank: 1,
                          pointDiff: "",
                          isHighlighted: false),
      medals: [
        ("https://picsum.photos/50", 1),
        ("https://picsum.photos/60", 2),
        ("https://picsum.photos/70", 3),
        ("https://picsum.photos/80", 3)
      ]
    )

    RankingPelotonView(
      title: "Consequat dolore esse commodo et do pariatur incididunt commodo duis ad id anim ullamco laborum.",
      description: "Labore culpa nostrud ipsum irure exercitation nostrud. Esse fugiat dolor non voluptate nostrud velit amet.",
      imageUrl: "https://picsum.photos/200/300",
      leadingItem: .init(title: "proident adipisicing ut",
                         imageUrl: "https://picsum.photos/200",
                         rank: 200,
                         pointDiff: "500pts d’écart",
                         isHighlighted: false),
      middleItem: .init(title: "sit consectetur in sint",
                        imageUrl: "https://picsum.photos/300",
                        rank: 199,
                        pointDiff: "2 542K pts d’écart",
                        isHighlighted: false),
      trailingItem: .init(title: "nostrud tempor irure laborum magna anim mollit voluptate commodo",
                          imageUrl: nil,
                          rank: 198,
                          pointDiff: "",
                          isHighlighted: true)
    )

    RankingPelotonView(
      title: "Consequat dolore esse commodo et do pariatur incididunt commodo duis ad id anim ullamco laborum.",
      description: "Labore culpa nostrud ipsum irure exercitation nostrud. Esse fugiat dolor non voluptate nostrud velit amet.",
      imageUrl: "https://picsum.photos/200/300",
      leadingItem: .init(title: "proident adipisicing ut",
                         imageUrl: "https://picsum.photos/200",
                         rank: 200,
                         pointDiff: "500pts d’écart",
                         isHighlighted: false),
      middleItem: .init(title: "sit consectetur in sint",
                        imageUrl: "https://picsum.photos/300",
                        rank: 199,
                        pointDiff: "2 542K pts d’écart",
                        isHighlighted: false),
      trailingItem: .init(title: "nostrud tempor irure laborum magna anim mollit voluptate commodo",
                          imageUrl: nil,
                          rank: 198,
                          pointDiff: "",
                          isHighlighted: true),
      showShield: false
    )
  }
  .listBackgroundColor(.bones(.AQILevel1))
  .listStyle(.grouped)
}
