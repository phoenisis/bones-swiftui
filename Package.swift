// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Bones",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v17)
	],
	products: [
		.library(
			name: "Bones",
			targets: ["Bones"]
		)
	],
  dependencies: [
    .package(
      url: "https://github.com/EmergeTools/Pow",
      .upToNextMajor(from: "1.0.0")
    ),
      .package(
        url: "https://github.com/raphaelmor/Polyline",
        .upToNextMajor(from: "5.0.0")
      ),
  ],
	targets: [
		.target(
			name: "Bones",
			dependencies: [
        .product(name: "Pow", package: "Pow"),
        .product(name: "Polyline", package: "Polyline"),
			],
			resources: [
				.process("Resources/Catalogs"),
				.process("Resources/Fonts"),
				.process("Resources/Lotties")
			],
			swiftSettings: [
				.enableUpcomingFeature("StrictConcurrency=complete"),
			]
		)
	]
)
