//
//  ColorModifier.swift
//
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import SwiftUI



/// A collection of static color values.
///
/// This extension provides a set of static color values that are easily accessible.


// MARK: - Preview
/// A preview struct for colors.
///
/// This struct provides a SwiftUI view that previews a color.
fileprivate struct ColorsPreview: View {
  var colorType: Color.BonesColorToken
  @State var isExpended: Bool = false

  var body: some View {
    HStack {
      Text(colorType.id.toWords)
        .font(.custom(.bones(.body)))

      Spacer()

      Circle()
        .foregroundStyle(
          Color(BonesColor.bones(colorType))
            .shadow(.bones.drop(.close))
        )
        .frame(width: 50, height: 50)
        .onTapGesture {
          isExpended.toggle()
        }
    }
    .sheet(isPresented: $isExpended, content: {
      NavigationStack {
        ScrollView {}
          .background(Color(BonesColor.bones(colorType)))
      }
      .presentationDetents([.medium, .large])
    })
  }
}

/// A SwiftUI view providing a list of color previews.
///
/// This struct displays a list of color previews using the `ColorsPreview` struct.
struct Preview_Colors: View {
  var body: some View {
    List {
      ForEach(Color.BonesColorToken.allCases) { color in
        ColorsPreview(colorType: color)
      }
    }
    .listBackgroundColor()
  }
}

/// Provides the capability to apply a tint to any view.
public extension View {
  /// Sets the tint color of the view.
  ///
  /// - Parameter bonesTint: An optional `BonesColor` to use as the tint.
  /// - Returns: A view with the applied tint color.
  @inlinable func tint(_ bonesTint: BonesColor?) -> some View {
    self.tint(bonesTint != nil ? Color(bonesTint!) : nil)
  }
}

#Preview {
  Preview_Colors()
}
