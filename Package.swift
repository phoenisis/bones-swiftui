// swift-tools-version: 6.0
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
    )
  ],
	targets: [
		.target(
			name: "Bones",
			dependencies: [
        .product(name: "Pow", package: "Pow")
			],
      resources: [
        .process("Resources/Catalogs"),
        .process("Resources/Fonts"),
        .process("Resources/Lotties")
      ], 
      swiftSettings: [
        .swiftLanguageVersion(.v6),
      ]
		)
	]
)
