// The Swift Programming Language
// https://docs.swift.org/swift-book

/// `BonesConfig` provides a centralized configuration instance for the Bones framework.
/// It allows easy access to framework-wide settings and configurations..
public final actor BonesConfig {
  /// Shared instance of `BonesConfig` for global access.
  public static let shared = BonesConfig()
  private init() {}
}
