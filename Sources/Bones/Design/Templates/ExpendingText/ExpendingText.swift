//
//  File.swift
//
//
//  Created by Quentin PIDOUX on 03/10/2023.
//

import SwiftUI

/// `ExpandingText` is a view that displays text which can be expanded or collapsed.
///
/// The text content is displayed, by default, in a truncated form, showing a maximum of 3 lines by defaults.
/// If the text is truncated, a "Show More" button will appear allowing the content to be expanded.
public struct ExpandingText: View {
  let text: String
  let showMoreText: String
  let fontToken: BonesFontToken
  let lineNumber: Int
  @State private var isExpanded: Bool
  @State private var isTruncated: Bool = false

  /// Creates a new `ExpandingText`.
  /// - Parameters:
  ///   - text: The text content to be displayed.
  ///   - font: The font style of the text.
  ///   - lineNumber: Maximum number of lines to display when text is not expanded. Default is 3.
  ///   - isExpanded: A Boolean value that determines whether the text is expanded or not. Default is true
  ///   - showMoreText: The text to display for the "Show More" button. Default is "show more".
  public init(
    _ text: String,
    font: BonesFontToken,
    lineNumber: Int = 3,
    isExpanded: Bool = false,
    showMoreText: String = "show more"
  ) {
    self.text = text
    self.fontToken = font
    self.lineNumber = lineNumber
    self.isExpanded = isExpanded
    self.showMoreText = showMoreText
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(text)
        .font(.custom(.bones(fontToken)))
        .lineLimit(isExpanded ? nil : lineNumber)
        .onTapGesture {
          if isTruncated && !isExpanded {
            isExpanded.toggle()
          }
        }
        .background(GeometryReader { geometry in
          Color.clear.onAppear {
            self.isTruncated = isTextTruncated(text, font: fontToken, in: geometry)
          }
        })

      if isTruncated && !isExpanded {
        Button(action: {
          isExpanded.toggle()
        }, label: {
          Text(showMoreText)
            .font(.custom(.bones(fontToken)))
            .foregroundStyle(Color.bones.grey4)
        })
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .animation(.default, value: isExpanded)
  }

  /// Determine if the text is truncated.
  ///
  /// - Parameters:
  ///   - text: The text content.
  ///   - font: The font style of the text.
  ///   - geometry: The available geometry to render the text.
  ///
  /// - Returns: A Boolean value indicating whether the text is truncated or not.
  func isTextTruncated(_ text: String, font: BonesFontToken, in geometry: GeometryProxy) -> Bool {
    let total = text.boundingRect(
      with: CGSize(width: geometry.size.width, height: .greatestFiniteMagnitude),
      options: .usesLineFragmentOrigin,
      attributes: [.font: UIFont(.bones(font))],
      context: nil)

    return total.size.height > geometry.size.height
  }
}


/// A preview of the `ExpandingText`.
struct Preview_ExpandingText: View {
  let smallText: String = "Velit aute ut cupidatat incididunt consequat ipsum occaecat dolore laborum proident nostrud."
  let longText: String = """
In proident sunt pariatur nulla nisi nulla excepteur Lorem officia exercitation. Nostrud et tempor magna sint. Non sit cillum ut culpa quis cupidatat id dolore. Aute ut elit eiusmod velit officia velit in. Qui ad sunt incididunt. Labore commodo esse consequat incididunt in occaecat nulla reprehenderit elit pariatur incididunt.

Nostrud irure irure duis duis est do occaecat elit irure incididunt ipsum sunt. Eu qui cillum nostrud. Esse nulla ad ut voluptate aliquip proident proident nostrud nisi cillum. Est dolore tempor fugiat ullamco ut sint laboris. Cillum irure tempor est mollit esse voluptate proident velit sit amet ea occaecat culpa consequat. Laborum qui cillum pariatur culpa aute quis. Magna deserunt nulla magna consequat ea amet ut excepteur. Ullamco elit nulla minim tempor fugiat nostrud proident nisi dolor Lorem laborum voluptate.
"""

  var body: some View {
    List {
      Section {
        ExpandingText(smallText, font: .body, isExpanded: false)
        ExpandingText(longText, font: .body, isExpanded: false)
      } header: {
        Text("Body")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        ExpandingText(longText, font: .body, isExpanded: true)
      } header: {
        Text("Body expended")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }

      Section {
        ExpandingText(smallText, font: .h1, isExpanded: false)
        ExpandingText(longText, font: .h1, isExpanded: false)
      } header: {
        Text("H1")
          .font(.bones(.bodyBold))
          .foregroundStyle(Color.bones.textDark)
      }
    }
    .listBackgroundColor()
  }
}

#Preview {
  Preview_ExpandingText()
}
