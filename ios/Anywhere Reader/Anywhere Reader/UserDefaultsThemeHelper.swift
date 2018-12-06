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
        case darkGray = "darkGray"
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
    /// - Parameters:
    ///     - string: The string version of the color, i.e. "black"
    ///     - providedColor: UserDefaultsThemeHelper.ProvidedColors enum value
    /// - Returns: UIColor
    /// - Author: Samantha Gatt
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
            return UIColor(red: 0.30, green: 0.30, blue: 0.30, alpha: 1.0)
        case .tan:
            return UIColor(red: 0.79, green: 0.73, blue: 0.58, alpha: 1.0)
        case .blue:
            return UIColor(red: 0.68, green: 0.85, blue: 0.90, alpha: 1.0)
        case .green:
            return UIColor(red: 0.60, green: 0.98, blue: 0.60, alpha: 1.0)
        case .darkGray:
            return UIColor(red: 0.17, green: 0.17, blue: 0.17, alpha: 1.0)
        case .custom:
            // TODO: fetch from user defaults or handle somehow
            return .black
        }
    }


    // MARK: - Public functions

    /**
        It determines the current title font stored in UserDefaults
     
        Gets the current font set in UserDefaults and determines the size the title font which is based on the difference between the body font size and title font size.

        - Returns: The current title font stored in UserDefaults
        - Author: Samantha Gatt
    */
    public func getTitleFont() -> UIFont {
        let bodySize = defaults.object(forKey: UserDefaultsThemeHelper.fontSizeKey) as? CGFloat ?? 17.0
        let size = bodySize + diffBetweenBodyAndTitle
        let name = defaults.string(forKey: UserDefaultsThemeHelper.titleFontKey) ?? UserDefaultsThemeHelper.FontName.defaultTitle.rawValue
        return UIFont(name: name, size: size)!
    }

    /**
        It stores the title font in UserDefaults
        - Parameter name: The name of the font chosen
        - Parameter size: The size of the font
        - Author: Samantha Gatt
     */
    public func setTitleFontName(name: UserDefaultsThemeHelper.FontName?, size: CGFloat?) {
        defaults.set(name?.rawValue, forKey: UserDefaultsThemeHelper.bodyFontKey)
    }

    /**
        It determines the current body font stored in UserDefaults
     
        Gets the current font set in UserDefaults and determines the size the body font which is based on the difference between the title font size and body font size.
     
        - Returns: The current body font stored in UserDefaults
        - Author: Samantha Gatt
     */
    public func getBodyFont() -> UIFont {
        let size = defaults.object(forKey: UserDefaultsThemeHelper.fontSizeKey) as? CGFloat ?? 17.0
        let name = defaults.string(forKey: UserDefaultsThemeHelper.bodyFontKey) ?? UIFont.preferredFont(forTextStyle: .body).fontName
        return UIFont(name: name, size: size) ?? UIFont.preferredFont(forTextStyle: .body)
    }
    
    /**
         It stores the body font in UserDefaults
         - Parameter name: The name of the font chosen
         - Parameter size: The size of the font
         - Author: Samantha Gatt
     */
    public func setBodyFont(name: UserDefaultsThemeHelper.FontName?, size: CGFloat?) {
        defaults.set(size, forKey: UserDefaultsThemeHelper.fontSizeKey)
        defaults.set(name?.rawValue, forKey: UserDefaultsThemeHelper.bodyFontKey)
    }

     /**
         It determines and returns the current text color stored in UserDefaults
     
         Gets the current font color in UserDefaults
     
         - Returns: The current font color stored in UserDefaults
         - Author: Samantha Gatt
     */
    public func getTextColor() -> UIColor {
        if let colorString = defaults.string(forKey: UserDefaultsThemeHelper.textColorKey) {
            return color(fromString: colorString)
        } else {
            return .black
        }
    }
    
    /**
        It stores the chosen text color in UserDefaults as a String

        Sets the chosen text color in UserDefaults with UserDefaultsThemeHelper.textColorKey as the key. The color is stored as a String.

        - Parameter providedColor: The color of the font based on the UserDefaultsThemeHelper.ProvidedColors enum
        - Parameter customColor: A custom UIColor
        - Author: Samantha Gatt
     */
    public func setTextColor(providedColor: UserDefaultsThemeHelper.ProvidedColors, customColor: UIColor? = nil) {
        defaults.set(providedColor.rawValue, forKey: UserDefaultsThemeHelper.textColorKey)
        if providedColor == .custom {
            defaults.set(customColor, forKey: UserDefaultsThemeHelper.customTextColorKey)
        }
    }
    
    /**
         It determines the current text color stored in UserDefaults
     
         Gets the current text color stored and UserDefaults and returns it accordingly. If there is nothing stored in UserDefaults, it defaults to a black color.
     
         - Returns: The current text color stored in UserDefaults
         - Author: Samantha Gatt
     */
    public func getTextProvidedColor() -> UserDefaultsThemeHelper.ProvidedColors {
        let string = defaults.string(forKey: UserDefaultsThemeHelper.textColorKey) ?? "Black"
        let textProvidedColor = UserDefaultsThemeHelper.ProvidedColors(rawValue: string) ?? .black
        return textProvidedColor
    }

    /**
         It determines the current background color stored in UserDefaults
     
         Gets the current background color stored and UserDefaults and returns it accordingly. If there is nothing stored in UserDefaults, it defaults to a white color.
     
         - Returns: The current background color stored in UserDefaults
         - Author: Samantha Gatt
     */
    public func getBackgroundColor() -> UIColor {
        if let colorString = defaults.string(forKey: UserDefaultsThemeHelper.backgroundColorKey) {
            return color(fromString: colorString)
        } else {
            return .white
        }
    }
    
    /**
        It stores the chosen text color in UserDefaults as a String

        Sets the chosen text color in UserDefaults with UserDefaultsThemeHelper.textColorKey as the key. The color is stored as a String.

        - Parameter providedColor: The color of the font based on the UserDefaultsThemeHelper.ProvidedColors enum
        - Parameter customColor: A custom UIColor
        - Author: Samantha Gatt
     */
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
    public func setNightMode() {
        let status = defaults.bool(forKey: "nightMode")
        if status {
            defaults.set(false, forKey: "nightMode")
        } else {
            defaults.set(true, forKey: "nightMode")
        }
    }
    public func isNightMode() -> Bool {
        return defaults.bool(forKey: "nightMode")
    }
}
