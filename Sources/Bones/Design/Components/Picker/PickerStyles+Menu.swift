//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 09/11/2023.
//

import SwiftUI

/// A custom SwiftUI view that creates a menu picker with an outline style.
///
/// This view is generic and can work with any type that conforms to `Identifiable`, `Equatable`, and `Hashable`.
public struct BonesSmallOutlineMenuPicker<Item>: View where Item: Identifiable, Item: Equatable, Item: Hashable {
  /// Placeholder text displayed when no item is selected.
  let placeholder: LocalizedStringKey
  /// The currently selected item.
  @State var selectedItem: Item? = nil
  /// The array of items to choose from.
  @State var data: [Item]
  /// A closure that provides a title for each item.
  let titleProvider: (Item) -> String

  var selectedItemChanged: (Item) -> Void

  /// Computes the title for the button based on the selected item.
  var buttonTitle: LocalizedStringKey {
    get {
      if let selectedItem = selectedItem, data.contains(selectedItem) {
        return LocalizedStringKey(titleProvider(selectedItem))
      } else {
        return placeholder
      }
    }
  }

  public init(
    _  placeholder: LocalizedStringKey? = nil,
    data: [Item],
    initialId: Item.ID? = nil,
    titleProvider: @escaping (Item) -> String,
    selectedItemChanged: @escaping (Item) -> Void
  ) {
    self.placeholder = placeholder ?? .init("select a value")
    self.titleProvider = titleProvider
    self._data = State(initialValue: data)
    self.selectedItemChanged = selectedItemChanged

    if let initialId {
      self._selectedItem = State(initialValue: data.first(where: { $0.id == initialId }))
    }
  }

  public var body: some View {
    Menu {
      Text(placeholder)
        .font(.custom(.bones(.bodyBold)))
      Picker(selection: $selectedItem) {
        ForEach(data) { item in
          Text(titleProvider(item))
            .tag(item as Item?)
        }
      } label: {}
    } label: {
      Button(buttonTitle) {}
        .buttonStyle(.bones(.select(.outline)))
        .animation(.default, value: buttonTitle)
    }
    .onChange(of: selectedItem) { _ , item in
      if let item {
        selectedItemChanged(item)
      }
    }
  }
}

/// A custom SwiftUI view that creates a menu picker with an outline style.
///
/// This view is generic and can work with any type that conforms to `Identifiable`, `Equatable`, and `Hashable`.
public struct BonesSmallFillMenuPicker<Item>: View where Item: Identifiable, Item: Equatable, Item: Hashable {
  /// Placeholder text displayed when no item is selected.
  let placeholder: LocalizedStringKey
  /// The currently selected item.
  @State var selectedItem: Item? = nil
  /// The array of items to choose from.
  @State var data: [Item]
  /// A closure that provides a title for each item.
  let titleProvider: (Item) -> String

  var selectedItemChanged: (Item) -> Void

  /// Computes the title for the button based on the selected item.
  var buttonTitle: LocalizedStringKey {
    get {
      if let selectedItem = selectedItem, data.contains(selectedItem) {
        return LocalizedStringKey(titleProvider(selectedItem))
      } else {
        return placeholder
      }
    }
  }

  public init(
    _  placeholder: LocalizedStringKey? = nil,
    data: [Item],
    initialId: Item.ID? = nil,
    titleProvider: @escaping (Item) -> String,
    selectedItemChanged: @escaping (Item) -> Void
  ) {
    self.placeholder = placeholder ?? .init("select a value")
    self.titleProvider = titleProvider
    self._data = State(initialValue: data)
    self.selectedItemChanged = selectedItemChanged

    if let initialId {
      self._selectedItem = State(initialValue: data.first(where: { $0.id == initialId }))
    }
  }

  public var body: some View {
    Menu {
      Text(placeholder)
        .font(.custom(.bones(.bodyBold)))
      
      Picker(selection: $selectedItem) {
        ForEach(data) { item in
          Text(titleProvider(item))
            .tag(item as Item?)
        }
      } label: {}
    } label: {
      Button(buttonTitle) {}
        .buttonStyle(.bones(.select(.fill)))
        .animation(.default, value: buttonTitle)
    }
    .onChange(of: selectedItem) { _, item in
      if let item {
        selectedItemChanged(item)
      }
    }
  }
}


/// A custom menu picker for selecting items from a list in SwiftUI.
///
/// This view creates a menu picker that allows users to select an item from a given list. Each item in the list is identifiable, equatable, and hashable.
///
/// Usage:
/// ```
/// BonesMenuPicker(placeholder: "Select Item", data: items, titleProvider: { item in
///     item.title
/// }, selectedItemChanged: { selectedItem in
///     // Handle the selection change
/// })
/// ```
///
/// - Parameters:
///   - placeholder: A `LocalizedStringKey` used as the placeholder text displayed when no item is selected.
///   - subtitle: An optional `LocalizedStringKey` for additional descriptive text.
///   - data: An array of items of type `Item` from which the user can choose.
///   - initialId: The optional ID of the initially selected item.
///   - titleProvider: A closure that returns a `String` title for each item.
///   - selectedItemChanged: A closure that is called when the selected item changes.
public struct BonesMenuPicker<Item>: View where Item: Identifiable, Item: Equatable, Item: Hashable {
  /// Placeholder text displayed when no item is selected.
  let placeholder: LocalizedStringKey
  let subtitle: LocalizedStringKey?
  /// The currently selected item.
  @State var selectedItem: Item? = nil
  /// The array of items to choose from.
  @State var data: [Item]
  /// A closure that provides a title for each item.
  let titleProvider: (Item) -> String

  var selectedItemChanged: (Item) -> Void

  /// Computes the title for the button based on the selected item.
  var buttonTitle: LocalizedStringKey {
    get {
      if let selectedItem = selectedItem, data.contains(selectedItem) {
        return LocalizedStringKey(titleProvider(selectedItem))
      } else {
        return placeholder
      }
    }
  }

  /// Creates an instance of `BonesMenuPicker`.
  ///
  /// - Parameters:
  ///   - placeholder: The placeholder text shown when no item is selected.
  ///   - subtitle: An optional subtitle text.
  ///   - data: An array of `Item` to be displayed in the picker.
  ///   - initialId: The optional initial ID of the item to be selected.
  ///   - titleProvider: A closure that provides a title for each item.
  ///   - selectedItemChanged: A closure called when the selected item changes.
  public init(
    _  placeholder: LocalizedStringKey? = nil,
    subtitle: LocalizedStringKey? = nil,
    data: [Item],
    initialId: Item.ID? = nil,
    titleProvider: @escaping (Item) -> String,
    selectedItemChanged: @escaping (Item) -> Void
  ) {
    self.placeholder = placeholder ?? .init("select a value")
    self.subtitle = subtitle
    self.titleProvider = titleProvider
    self._data = State(initialValue: data)
    self.selectedItemChanged = selectedItemChanged

    if let initialId {
      self._selectedItem = State(initialValue: data.first(where: { $0.id == initialId }))
    }
  }

  public var body: some View {
    Menu {
      Text(placeholder)
        .font(.custom(.bones(.bodyBold)))

      Picker(selection: $selectedItem) {
        ForEach(data) { item in
          Text(titleProvider(item))
            .tag(item as Item?)
        }
      } label: {}
    } label: {
      VStack(alignment: .leading, spacing: .bones(.small)) {
        HStack(alignment: .center, spacing: .bones(.small), content: {
          Text(buttonTitle)
            .font(.custom(.bones(.bodyBold)))
          BonesIcon(icon: .bones(.chevronDown))
            .frame(width: 16, height: 16)
        })

        if let subtitle {
          Text(subtitle)
            .font(.custom(.bones(.small)))
        }
      }
      .animation(.default, value: buttonTitle)
    }
    .tint(.bones(.black))
    .onChange(of: selectedItem) { _, item in
      if let item {
        selectedItemChanged(item)
      }
    }
  }
}

struct Preview_BonesMenuPicker: View {
  public struct MenuItem: Identifiable, Equatable, Hashable {
    let id: String
    let name: String

    public init(id: String, name: String) {
      self.id = id
      self.name = name
    }
  }

  let menuItems: [MenuItem] = [MenuItem(id: "1", name: "test"), MenuItem(id: "2", name: "test2")]

  var body: some View {
    List {
      BonesMenuPicker("Select a value", subtitle: "Date de début - Date de fin", data: menuItems) { item in
        item.name
      } selectedItemChanged: { item in
        print(item)
      }

      BonesMenuPicker("Select a value", subtitle: nil, data: menuItems) { item in
        item.name
      } selectedItemChanged: { item in
        print(item)
      }

      BonesSmallOutlineMenuPicker(data: menuItems) { item in
        item.name
      } selectedItemChanged: { item in
        print(item)
      }

      BonesSmallFillMenuPicker(data: menuItems) { item in
        item.name
      } selectedItemChanged: { item in
        print(item)
      }
    }
  }
}

#Preview {
  Preview_BonesMenuPicker()
}
