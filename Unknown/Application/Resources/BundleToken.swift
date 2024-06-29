//
//  BundleToken.swift
//  Doublicat
//
//  Created by Nikita Pankiv on 12.08.2021.
//

import Foundation

// swiftlint:disable convenience_type
final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
