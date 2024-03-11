// The Swift Programming Language
// https://docs.swift.org/swift-book

@_exported import Pow

public final class Bones {
  @discardableResult
  public init(colors: EnvColors, assets: EnvAssets) {
    envTheme.colors = colors
    envTheme.assets = assets
	}
}
