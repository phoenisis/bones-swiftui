//
//  File.swift
//  
//
//  Created by Quentin PIDOUX on 25/09/2023.
//

import Foundation

/// A utility class used to find the bundle where design resources are located.
/// This class is utilized within the `designBundle` extension of `Bundle`.
private class BundleFinder { }

extension Bundle {
  /// `designBundle` is a static computed property on `Bundle`. It tries to locate
  /// and return the design bundle, where design-related resources are expected to be found.
  ///
  /// Usage:
  /// Replace `Bundle.module` with `Bundle.designBundle` in cases where `Bundle.module` doesn’t work.
  ///
  /// ```
  /// Bundle.designBundle
  /// ```
	static var designBundle: Bundle = {
		let bundleName = "Bones_Bones"
    // An array of URLs that are the candidates where the bundle may be located.
		let candidates = [
			Bundle.main.resourceURL,
			Bundle(for: BundleFinder.self).resourceURL,
			Bundle.main.bundleURL,
			Bundle(for: BundleFinder.self)
				.resourceURL?
				.deletingLastPathComponent()
				.deletingLastPathComponent()
				.deletingLastPathComponent(),
			Bundle(for: BundleFinder.self)
				.resourceURL?
				.deletingLastPathComponent()
				.deletingLastPathComponent()
		].compactMap { $0 }

    // Trying each candidate URL to find the bundle.
		for candidate in candidates {
			let bundleUrl = candidate.appendingPathComponent(bundleName + ".bundle")
			if let bundle = Bundle(url: bundleUrl) {
				return bundle
			}
		}
    // If the bundle cannot be found, it causes a fatal error and terminates the app.
		fatalError("Unable to load bundle")
	}()
}
