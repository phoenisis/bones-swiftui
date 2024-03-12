//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 26/09/2023.
//

import SwiftUI

extension View {
  /// Applies padding to the view based on the BonesPadding value.
  ///
  /// - Parameter bonesLength: The padding value as `BonesPadding`.
  ///
  /// - Returns: A view with applied padding.
	@inlinable public func padding(_ bonesLength: BonesSpacing) -> some View {
		switch bonesLength {
			case .bones(let size):
				return self
					.padding(size.rawValue)
		}
	}

  /// Applies padding to specific edges of the view based on the BonesPadding value.
  ///
  /// - Parameters:
  ///   - edges: The edges where the padding should be applied.
  ///   - bonesLength: The padding value as `BonesPadding`.
  ///
  /// - Returns: A view with applied padding to specific edges.
	@inlinable public func padding(_ edges: Edge.Set = .all, _ bonesLength: BonesSpacing) -> some View {
		switch bonesLength {
			case .bones(let size):
				return self
					.padding(edges, size.rawValue)
		}
	}

  /// Applies corner radius to the view based on the BonesRadius value.
  ///
  /// - Parameters:
  ///   - bonesRadius: The corner radius value as `BonesRadius`.
  ///   - antialiased: A Boolean value that determines whether the corner radius should be antialiased.
  ///
  /// - Returns: A view with applied corner radius.
	public func cornerRadius(_ bonesRadius: BonesRadius, antialiased: Bool = true) -> some View {
		switch bonesRadius {
			case .bones(let size):
				return self
					.cornerRadius(
						size.rawValue,
						antialiased: antialiased
					)
		}
	}
}

public extension RoundedRectangle {
  /// Initializes an RoundedRectangle with a corner radius based on the BonesRadius value.
  ///
  /// - Parameters:
  ///   - bonesRadius: The corner radius value as `BonesRadius`.
  ///   - style: The corner style as `RoundedCornerStyle`.
  ///
	@inlinable init(bonesRadius: BonesRadius, style: RoundedCornerStyle = .continuous) {
		switch bonesRadius {
			case let .bones(radius):
				self.init(cornerRadius: radius.rawValue, style: style)
		}

	}
}

public extension UnevenRoundedRectangle {
  @inlinable init(topLeadingRadius: CGFloat.BonesRadius = .none, bottomLeadingRadius: CGFloat.BonesRadius = .none, bottomTrailingRadius: CGFloat.BonesRadius = .none, topTrailingRadius: CGFloat.BonesRadius = .none, style: RoundedCornerStyle = .continuous) {
    self.init(
      topLeadingRadius: topLeadingRadius.rawValue,
      bottomLeadingRadius: bottomLeadingRadius.rawValue,
      bottomTrailingRadius: bottomTrailingRadius.rawValue,
      topTrailingRadius: topTrailingRadius.rawValue,
      style: style
    )
  }
}

public extension HStack {
  /// Initializes an HStack with spacing based on the BonesPadding value.
  ///
  /// - Parameters:
  ///   - alignment: Alignment of the stack.
  ///   - spacing: The spacing value as `BonesPadding`.
  ///   - content: The content within the stack.
  ///
	init(alignment: VerticalAlignment = .center, spacing: BonesSpacing, @ViewBuilder content: () -> Content) {
		switch spacing {
			case .bones(let bonesPaddingToken):
				self.init(alignment: alignment, spacing: CGFloat(bonesPaddingToken.rawValue), content: content)
		}
	}
}

public extension VStack {
  /// Initializes a VStack with spacing based on the BonesPadding value.
  ///
  /// - Parameters:
  ///   - alignment: Alignment of the stack.
  ///   - spacing: The spacing value as `BonesPadding`.
  ///   - content: The content within the stack.
  ///
	init(alignment: HorizontalAlignment = .center, spacing: BonesSpacing, @ViewBuilder content: () -> Content) {
		switch spacing {
			case .bones(let bonesPaddingToken):
				self.init(alignment: alignment, spacing: CGFloat(bonesPaddingToken.rawValue), content: content)
		}

	}
}

// MARK: - Preview
// Previews to visualize the different sizes of padding and radius.
fileprivate struct PaddingRadiusPreview: View {
	var type: PaddingRadiusType
	var name: String

	enum PaddingRadiusType {
		case padding(BonesSpacing)
		case radius(BonesRadius)
	}

	var body: some View {
		HStack {
			Text(name)
				.font(.custom(.bones(.body)))
			Spacer()
			if case .padding(let value) = type {
				Text("")
					.padding(value)
					.background(Color.bones.primary)

			} else if case .radius(let value) = type {
        RoundedRectangle(bonesRadius: value, style: .continuous)
          .foregroundStyle(
            Color.bones.primary
              .shadow(.bones.drop(.close))
          )
          .frame(width: 64, height: 64)
			}
		}
		.previewDisplayName(name)
	}
}

struct Preview_Sizes: View {
	var body: some View {
		List {
			Section {
        ForEach(CGFloat.BonesSpacing.allCases) { padding in
					PaddingRadiusPreview(type: .padding(.bones(padding)), name: padding.id)
				}
			} header: {
				Text("Padding")
				.font(.custom(.bones(.bodyBold)))
				.foregroundStyle(Color.bones.textDark)
			}

			Section {
				ForEach(CGFloat.BonesRadius.allCases) { radius in
					PaddingRadiusPreview(type: .radius(.bones(radius)), name: radius.id)
				}
			} header: {
				Text("Radius")
					.font(.custom(.bones(.bodyBold)))
					.foregroundStyle(Color.bones.textDark)
			}
		}
		.listBackgroundColor()
	}
}

#Preview {
	Preview_Sizes()
}
