// The Swift Programming Language
// https://docs.swift.org/swift-book

@_exported import Pow

/// `BonesConfig` is a singleton class used to configure the Bones framework.
/// It provides a shared instance that can be accessed globally.
public struct BonesConfig {
  public static let shared = BonesConfig()
  private init() {}
}
