// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name redundant_string_enum_value
enum AssetColor: String {
    case lightGreen = "LightGreen"
    case backgroundDark = "backgroundDark"
    case barButtonGray = "barButtonGray"
    case beautifulRed = "beautifulRed"
    case black = "black"
    case blackElevated = "blackElevated"
    case bluishGray = "bluishGray"
    case button = "button"
    case darkBlue = "darkBlue"
    case darkGray = "darkGray"
    case darkGrayWithAlpha = "darkGrayWithAlpha"
    case electricBlue = "electricBlue"
    case electricRed = "electricRed"
    case electricYellow = "electricYellow"
    case errorRed = "errorRed"
    case gold = "gold"
    case gray = "gray"
    case halfBlack = "halfBlack"
    case halfWhite = "halfWhite"
    case lightBlack = "lightBlack"
    case lightBlue = "lightBlue"
    case mint = "mint"
    case newResult = "newResult"
    case orange = "orange"
    case purple = "purple"
    case red = "red"
    case secondaryText = "secondaryText"
    case toolTipLightBlue = "toolTipLightBlue"
    case transparentGray = "transparentGray"
    case white = "white"
    case yellow = "yellow"
}

extension UIColor {
    class var lightGreen: UIColor { AssetColor(rawValue: "LightGreen")!.uiColor }
    class var backgroundDark: UIColor { AssetColor(rawValue: "backgroundDark")!.uiColor }
    class var barButtonGray: UIColor { AssetColor(rawValue: "barButtonGray")!.uiColor }
    class var beautifulRed: UIColor { AssetColor(rawValue: "beautifulRed")!.uiColor }
    class var black: UIColor { AssetColor(rawValue: "black")!.uiColor }
    class var blackElevated: UIColor { AssetColor(rawValue: "blackElevated")!.uiColor }
    class var bluishGray: UIColor { AssetColor(rawValue: "bluishGray")!.uiColor }
    class var button: UIColor { AssetColor(rawValue: "button")!.uiColor }
    class var darkBlue: UIColor { AssetColor(rawValue: "darkBlue")!.uiColor }
    class var darkGray: UIColor { AssetColor(rawValue: "darkGray")!.uiColor }
    class var darkGrayWithAlpha: UIColor { AssetColor(rawValue: "darkGrayWithAlpha")!.uiColor }
    class var electricBlue: UIColor { AssetColor(rawValue: "electricBlue")!.uiColor }
    class var electricRed: UIColor { AssetColor(rawValue: "electricRed")!.uiColor }
    class var electricYellow: UIColor { AssetColor(rawValue: "electricYellow")!.uiColor }
    class var errorRed: UIColor { AssetColor(rawValue: "errorRed")!.uiColor }
    class var gold: UIColor { AssetColor(rawValue: "gold")!.uiColor }
    class var gray: UIColor { AssetColor(rawValue: "gray")!.uiColor }
    class var halfBlack: UIColor { AssetColor(rawValue: "halfBlack")!.uiColor }
    class var halfWhite: UIColor { AssetColor(rawValue: "halfWhite")!.uiColor }
    class var lightBlack: UIColor { AssetColor(rawValue: "lightBlack")!.uiColor }
    class var lightBlue: UIColor { AssetColor(rawValue: "lightBlue")!.uiColor }
    class var mint: UIColor { AssetColor(rawValue: "mint")!.uiColor }
    class var newResult: UIColor { AssetColor(rawValue: "newResult")!.uiColor }
    class var orange: UIColor { AssetColor(rawValue: "orange")!.uiColor }
    class var purple: UIColor { AssetColor(rawValue: "purple")!.uiColor }
    class var red: UIColor { AssetColor(rawValue: "red")!.uiColor }
    class var secondaryText: UIColor { AssetColor(rawValue: "secondaryText")!.uiColor }
    class var toolTipLightBlue: UIColor { AssetColor(rawValue: "toolTipLightBlue")!.uiColor }
    class var transparentGray: UIColor { AssetColor(rawValue: "transparentGray")!.uiColor }
    class var white: UIColor { AssetColor(rawValue: "white")!.uiColor }
    class var yellow: UIColor { AssetColor(rawValue: "yellow")!.uiColor }
}

// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

extension AssetColor {
    var uiColor: UIColor {
        return UIColor(named: rawValue, in: BundleToken.bundle, compatibleWith: nil)!
    }
}
