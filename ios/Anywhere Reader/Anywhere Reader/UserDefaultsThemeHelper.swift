//
//  UserDefaultsThemeHelper.swift
//  Anywhere Reader
//
//  Created by Samantha Gatt on 11/15/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class UserDefaultsThemeHelper {

    // MARK: - Font name enum

    enum FontName: String {
        case defaultBody = "Helvetica"
        case defaultTitle = "Helvetica-Bold"
    }

    enum ProvidedColors: String {
        case black = "Black"
        case white = "White"
        case gray = "Gray"
        case tan = "Tan"
        case blue = "Blue"
        case green = "Green"
        case custom = "Custom"
    }

    // MARK: - User Defaults Keys

    static let textColorKey = "textColor"
    static let customTextColorKey = "customTextColor"
    static let backgroundColorKey = "backgroundColor"
    static let customBackgroundColorKey = "customBackgroundColor"
    static let fontSizeKey = "fontSize"
    static let bodyFontKey = "bodyFont"
    static let titleFontKey = "titleFont"


    // MARK: - Static properties

    static let shared = UserDefaultsThemeHelper()
    static let providedColors: [UserDefaultsThemeHelper.ProvidedColors] = [.black,
            .white,
            .gray,
            .tan,
            .blue,
            .green,
            .custom]


    // MARK: - Public properties

    var diffBetweenBodyAndTitle: CGFloat = 12.0


    // MARK: - Private properties

    private let defaults = UserDefaults.standard


    // MARK: - Private functions

    /// Returns a UIColor from a providedColor (enum) or its rawValue (string)
    ///
    /// Only one of the parameters should be used.
    /// If both are entered into the function, only the string will be used.
    private func color(fromString string: String? = nil, fromProvidedColor providedColor: UserDefaultsThemeHelper.ProvidedColors? = nil) -> UIColor {

        let color: UserDefaultsThemeHelper.ProvidedColors
        if let string = string {
            color = UserDefaultsThemeHelper.ProvidedColors(rawValue: string) ?? .black
        } else {
            color = providedColor ?? .black
        }

        switch color {
        case .black:
            return .black
        case .white:
            return .white
        case .gray:
            return .lightGray
        case .tan:
            return UIColor(red: 0.79, green: 0.73, blue: 0.58, alpha: 1.0)
        case .blue:
            return UIColor(red: 0.68, green: 0.85, blue: 0.90, alpha: 1.0)
        case .green:
            return UIColor(red: 0.60, green: 0.98, blue: 0.60, alpha: 1.0)
        case .custom:
            // TODO: fetch from user defaults or handle somehow
            return .black
        }
    }


    // MARK: - Public functions

    // Title font
    public func getTitleFont() -> UIFont {
        let bodySize = defaults.object(forKey: UserDefaultsThemeHelper.fontSizeKey) as? CGFloat ?? 17.0
        let size = bodySize + diffBetweenBodyAndTitle
        let name = defaults.string(forKey: UserDefaultsThemeHelper.titleFontKey) ?? UserDefaultsThemeHelper.FontName.defaultTitle.rawValue
        return UIFont(name: name, size: size)!
    }

    public func setTitleFontName(name: UserDefaultsThemeHelper.FontName?, size: CGFloat?) {
        defaults.set(name?.rawValue, forKey: UserDefaultsThemeHelper.bodyFontKey)
    }

    // Body font
    public func getBodyFont() -> UIFont {
        let size = defaults.object(forKey: UserDefaultsThemeHelper.fontSizeKey) as? CGFloat ?? 17.0
        let name = defaults.string(forKey: UserDefaultsThemeHelper.bodyFontKey) ?? UIFont.preferredFont(forTextStyle: .body).fontName
        return UIFont(name: name, size: size) ?? UIFont.preferredFont(forTextStyle: .body)
    }
    public func setBodyFont(name: UserDefaultsThemeHelper.FontName?, size: CGFloat?) {
        defaults.set(size, forKey: UserDefaultsThemeHelper.fontSizeKey)
        defaults.set(name?.rawValue, forKey: UserDefaultsThemeHelper.bodyFontKey)
    }

    // Text color
    public func getTextColor() -> UIColor {
        if let colorString = defaults.string(forKey: UserDefaultsThemeHelper.textColorKey) {
            return color(fromString: colorString)
        } else {
            return .black
        }
    }
    /// Only enter customColor if provededColor == .custom
    public func setTextColor(providedColor: UserDefaultsThemeHelper.ProvidedColors, customColor: UIColor? = nil) {
        defaults.set(providedColor.rawValue, forKey: UserDefaultsThemeHelper.textColorKey)
        if providedColor == .custom {
            defaults.set(customColor, forKey: UserDefaultsThemeHelper.customTextColorKey)
        }
    }
    public func getTextProvidedColor() -> UserDefaultsThemeHelper.ProvidedColors {
        let string = defaults.string(forKey: UserDefaultsThemeHelper.textColorKey) ?? "Black"
        let textProvidedColor = UserDefaultsThemeHelper.ProvidedColors(rawValue: string) ?? .black
        return textProvidedColor
    }

    public func getBackgroundColor() -> UIColor {
        if let colorString = defaults.string(forKey: UserDefaultsThemeHelper.backgroundColorKey) {
            return color(fromString: colorString)
        } else {
            return .white
        }
    }
    public func setBackgroundColor(providedColor: UserDefaultsThemeHelper.ProvidedColors, customColor: UIColor? = nil) {
        defaults.set(providedColor.rawValue, forKey: UserDefaultsThemeHelper.backgroundColorKey)
        if providedColor == .custom {
            defaults.set(customColor, forKey: UserDefaultsThemeHelper.customBackgroundColorKey)
        }
    }
    public func getBackgroundProvidedColor() -> UserDefaultsThemeHelper.ProvidedColors {
        let string = defaults.string(forKey: UserDefaultsThemeHelper.backgroundColorKey) ?? "Black"
        let textProvidedColor = UserDefaultsThemeHelper.ProvidedColors(rawValue: string) ?? .black
        return textProvidedColor
    }
}
