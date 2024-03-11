//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 03/11/2023.
//

import SwiftUI

struct HomeCardView: View {
  var body: some View {
    GeometryReader { geo in
      VStack {
        CachedAsyncImage(url: URL(string: "https://picsum.photos/60")) { image in image.resizable()
        } placeholder: {
          ProgressView()
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(Color.bones.grey4)
        }
        .frame(height: geo.size.height/2)
        .overlay(content: {
          Color.bones.black.opacity(0.2)
        })
        .overlay(alignment: .topLeading) {
          HStack(alignment: .top, content: {
            Text("GIVE ME FIVE!")
              .textCase(.uppercase)
              .font(.custom(.bones(.h3)))
            Spacer()
            Button(action: {}, label: {
              BonesIcon(icon: .bones(.share), renderingMode: .template)
                .frame(width: 24, height: 24)
            })
          })
          .padding(.bones(.large))
          .foregroundStyle(Color.bones.textLight)
        }

        VStack(alignment: .leading,
               spacing: .bones(.medium),
               content: {
          HStack(spacing: .bones(.medium)) {
            BonesIcon(icon: .bones(.great))
              .frame(width: 16, height: 16)

            Text("sondage du jour")
              .textCase(.uppercase)
              .font(.custom(.bones(.extraSmall)))
              .fontWeight(.black)
          }
          Spacer()
          Text("Funky pas funky?... Partage ta vibe du jour!")
            .textCase(.uppercase)
            .font(.custom(.bones(.h3)))
          Spacer()

          HStack(
            alignment: .center,
            spacing: .bones(.medium),
            content: {
              Text("participer au sondage")
                .textCase(.uppercase)
                .font(.custom(.bones(.small)))
              BonesIcon(icon: .bones(.arrowRight))
                .frame(width: 24, height: 24)
            })
          .frame(maxWidth: .infinity, alignment: .trailing)
        })
        .foregroundStyle(Color.bones.textDark)
        .padding(.bones(.large))
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .frame(height: geo.size.height/2)
      }
    }
    .overlay(alignment: .trailing, content: {
      Text("GAGNE **5 POINTS**")
        .multilineTextAlignment(.center)
        .font(.custom(.bones(.body)))
        .frame(width: 115)
        .padding(.bones(.large))
        .background(
          BonesEarnPointShape()
            .fill(Color.bones.AQILevel1)
            .frame(width: 115)
            .aspectRatio(1.5, contentMode: .fit)
            .shadow(radius: .bones(.close))
        )
        .foregroundStyle(Color.bones.textDark)
    })
    .dynamicTypeSize(.xSmall ... .xxLarge)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .aspectRatio(1, contentMode: .fill)
    .listRowInsets(EdgeInsets())
    .listRowSeparator(.hidden)
    .listRowBackground(
      RoundedRectangle(bonesRadius: .bones(.medium), style: .continuous)
        .fill(Color.bones.white)
        .shadow(radius: .bones(.close))
    )
  }
}


#Preview {
  List {
    HomeCardView()
    HomeCardView()
  }
  .listRowSpacing(16)
  .listBackgroundColor()
}
