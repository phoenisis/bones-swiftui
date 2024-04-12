//
//  BottomTabView.swift
//
//
//  Created by Quentin PIDOUX on 07/11/2023.
//

import SwiftUI

struct TabItemData {
  let image: String
  let selectedImage: String
  let title: String
  let isMoveButton: Bool
}

struct TabItemView: View {
  let data: TabItemData
  let isSelected: Bool

  var body: some View {
    VStack(
      alignment: .center,
      spacing: .bones(.small)
    ) {
      if data.isMoveButton {
        //        Button("Move") {}
        //          .buttonStyle(.bones(.homePlay))
        Spacer().frame(height: 40)
      } else {
        Image(isSelected ? data.selectedImage : data.image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 40, height: 40)
      }

      Text(data.title)
        .foregroundColor(isSelected ? .black : .gray)
        .font(.custom(.bones(.small)))
        .fontWeight(.bold)
    }
    .frame(alignment: .bottom)
  }
}

struct TabBottomView: View {

  let bottomInset: CGFloat
  let tabbarItems: [TabItemData]
  @Binding var selectedIndex: Int

  var body: some View {
    GeometryReader(content: { geometry in
      HStack {
        Spacer()
        ForEach(tabbarItems.indices, id: \.self) { index in
          let item = tabbarItems[index]
          if item.isMoveButton {
            VStack(alignment: .center) {
              Spacer().frame(height: 44)
              Text("122 pas")
                .font(.custom(.bones(.smallBold)))
            }
            .frame(width: geometry.size.width/CGFloat(tabbarItems.count+1))
            .overlay(alignment: .center) {
              Button("Move") {}
                .buttonStyle(.bones(.homePlay))
                .padding(.bottom, 44)
            }
          } else {
            Button {
              self.selectedIndex = index
            } label: {
              let isSelected = selectedIndex == index
              TabItemView(data: item, isSelected: isSelected)
                .frame(width: geometry.size.width/CGFloat(tabbarItems.count+1))
            }
          }
          Spacer()
        }
      }
      .padding(.bottom, bottomInset)
    })
    .frame(height: 70)
    .frame(maxWidth: .infinity)
    .animation(.default, value: selectedIndex)
    .background(
      UnevenRoundedRectangle(
        topLeadingRadius: .large,
        topTrailingRadius: .large
      )
      .fill(
        Color.bones.white
          .shadow(.bones.drop(.far))
      )
    )
  }
}

struct CustomTabView<Content: View>: View {
  @State var safeAreaInsets: EdgeInsets = .init()

  let tabs: [TabItemData]
  @Binding var selectedIndex: Int
  @ViewBuilder let content: (Int) -> Content

  var body: some View {
    ZStack {
      TabView(selection: $selectedIndex) {
        ForEach(tabs.indices, id: \.self) { index in
          content(index)
            .tag(index)
        }
      }

      VStack {
        Spacer()
        TabBottomView(bottomInset: safeAreaInsets.bottom, tabbarItems: tabs, selectedIndex: $selectedIndex)
      }
    }
    .ignoresSafeArea()
    .getSafeAreaInsets($safeAreaInsets)
  }
}

enum TabType: Int, CaseIterable {
  case home = 0
  case socialWall
  case move
  case team
  case profile

  var tabItem: TabItemData {
    switch self {
      case .home:
        return TabItemData(image: "ic_home", selectedImage: "ic_home_selected", title: "Home", isMoveButton: false)
      case .socialWall:
        return TabItemData(image: "ic_home", selectedImage: "ic_home_selected", title: "Social wall", isMoveButton: false)
      case .team:
        return TabItemData(image: "ic_myfile", selectedImage: "ic_myfile_selected", title: "Team", isMoveButton: false)
      case .profile:
        return TabItemData(image: "ic_profile", selectedImage: "ic_profile_selected", title: "profile", isMoveButton: false)
      case .move:
        return TabItemData(image: "ic_profile", selectedImage: "ic_profile_selected", title: "Move", isMoveButton: true)
    }
  }
}

struct MainTabView: View {
  @State var selectedIndex: Int = 0

  var body: some View {
    CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
      let type = TabType(rawValue: index) ?? .home
      getTabView(type: type)
    }
  }

  @ViewBuilder
  func getTabView(type: TabType) -> some View {
    switch type {
      case .home:
        List{}
          .listBackgroundColor()
      case .socialWall:
        List{}
          .listBackgroundColor(.bones(.AQILevel1))
      case .team:
        List{}
          .listBackgroundColor(.bones(.AQILevel2))
      case .move:
        List{}
          .listBackgroundColor(.bones(.AQILevel3))

      case .profile:
        List{}
          .listBackgroundColor(.bones(.AQILevel4))

    }
  }
}

#Preview {
  MainTabView()
}



struct SafeAreaInsetsKey: PreferenceKey {
  static var defaultValue = EdgeInsets()
  static func reduce(value: inout EdgeInsets, nextValue: () -> EdgeInsets) {
    value = nextValue()
  }
}

extension View {
  func getSafeAreaInsets(_ safeInsets: Binding<EdgeInsets>) -> some View {
    background(
      GeometryReader { proxy in
        Color.clear
          .preference(key: SafeAreaInsetsKey.self, value: proxy.safeAreaInsets)
      }
      .onPreferenceChange(SafeAreaInsetsKey.self) { value in
        safeInsets.wrappedValue = value
      }
    )
  }
}
