//
//  SwiftUIView.swift
//
//
//  Created by Quentin PIDOUX on 18/10/2023.
//

import SwiftUI

/// `ChipGroupView`
/// A SwiftUI view that presents a horizontal, scrollable group of chips.
///
/// Each chip in the group is clickable, and the group is scrollable to allow navigation
/// through a potentially large number of chips.
///
/// - Note:
///   The chips are displayed in a horizontal ScrollView, allowing for a dynamic number of
///   chips that can exceed the screen width.

struct ChipGroupView: View {
  /// `Chip`
  /// Represents an individual chip within a `ChipGroupView`.
  ///
  /// Each chip has a title and a unique identifier.
  struct Chip: Identifiable {
    var title: String
    let id: Int
  }

  @State var selectedIndex: Int // Index of the currently selected chip.
  @State var chips: [Chip] // Collection of chips to be displayed.

  /// Creates a new instance of `ChipGroupView`.
  ///
  /// - Parameters:
  ///   - selectedIndex: The index of the initially selected chip.
  ///   - chips: An array of strings representing the titles of each chip.
  public init(selectedIndex: Int, chips: [String]) {
    self.selectedIndex = selectedIndex
    self.chips = chips.enumerated().map { element in
        .init(title: element.element, id: element.offset)
    }
  }

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      ScrollViewReader { proxy in
        HStack {
          ForEach(chips) { chip in
            Button(chip.title) {
              selectedIndex = chip.id
              withAnimation(.spring()){
                proxy.scrollTo(chip.id, anchor: .center)
              }
            }
            .buttonStyle(.bones(.chip(selected: chip.id == selectedIndex)))
          }
          .padding(1)
        }
        .onAppear {
          proxy.scrollTo(chips[selectedIndex].id, anchor: .center)
        }
      }
    }
    .frame(maxWidth: .infinity)
    .dynamicTypeSize(.xSmall ... .accessibility3)
  }
}

/// `Preview_ChipGroupView`
/// A preview provider to visualize the `ChipGroupView` within the canvas during design time.
struct Preview_ChipGroupView: View {
  var body: some View {
    List {
      Section {
        ChipGroupView(
          selectedIndex: 0,
          chips: [
            "consequat labore",
            "proident nisi"
          ]
        )

        ChipGroupView(
          selectedIndex: 0,
          chips: [
            "enim adipisicing",
            "culpa excepteur",
            "nostrud",
            "dolor",
            "sunt"
          ]
        )
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_ChipGroupView()
}
